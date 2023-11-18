# frozen_string_literal: true

class CheckoutsController < ApplicationController
  before_action :user_carts, only: %i[new create]
  before_action :basic_auth, only: %i[index show]
  before_action :set_promotion_code, only: %i[index new create]
  def index
    @checkouts = current_cart.checkouts.includes(:checkout_products).order(created_at: :DESC)
  end

  def show
    @checkout_product = CheckoutProduct.find(params[:id])
    @checkout = @checkout_product.checkout
  end

  def new
    @checkout = Checkout.new
    @promotion_code = PromotionCode.new
  end

  def create
    @checkout = Checkout.new(checkout_params)
    ActiveRecord::Base.transaction do
      @checkout.save!
      checkout_product = current_cart.create_checkout_products!(@checkout.id)
      current_cart.update!(is_promotion_code: false)
      @current_promotion_code&.update!(checkout_product_id: checkout_product.id)
    end
    CheckoutMailer.creation_email(@checkout).deliver_now
    current_cart.items.destroy_all
    redirect_to products_path, flash: { success: '購入ありがとうございます' }
  rescue StandardError => e
    if @checkout.errors.present?
      render 'new', status: :unprocessable_entity
    else
      redirect_to new_checkout_path, flash: { error: e.message }
    end
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

  def set_promotion_code
    @current_promotion_code = current_cart.promotion_code.find_by(checkout_product_id: nil)
  end
end
