# frozen_string_literal: true

class CheckoutsController < ApplicationController
  before_action :user_carts, only: %i[new create]
  before_action :basic_auth, only: %i[index show]
  def index
    @checkouts = current_cart.checkouts.includes(:checkout_products).order(created_at: :DESC)
  end

  def show
    @checkout_product = CheckoutProduct.find(params[:id])
    @checkout = @checkout_product.checkout
  end

  def new
    @checkout = Checkout.new
  end

  def create
    @checkout = Checkout.new(checkout_params)
    unless @checkout.save
      render 'new', status: :unprocessable_entity
      return
    end

    begin
      @checkout.create_checkout_product(current_cart)
      redirect_to products_path, flash: { success: '購入ありがとうございます' }
    rescue StandardError => e
      redirect_to new_checkout_path, flash: { error: e.message }
      return
    end

    CheckoutMailer.creation_email(@checkout, current_cart.items).deliver_now
    current_cart.items.destroy_all
  end

  private

  def checkout_params
    params.require(:checkout).permit(:first_name, :last_name, :username, :address, :address2, :email, :country,
                                     :prefecture_id, :zip, :is_same_address, :is_save, :name_on_card,
                                     :credit_card_number, :expiration, :cvv).merge(cart_id: current_cart.id)
  end

  def user_carts
    @user_carts = current_cart.items.includes(:product)
    redirect_to products_path, flash: { danger: 'カートに商品を追加してください' } if @user_carts.empty?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |user, password|
      user == Rails.application.credentials.manage[:basic_auth_name] &&
        password == Rails.application.credentials.manage[:basic_auth_password]
    end
  end
end
