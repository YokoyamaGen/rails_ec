# frozen_string_literal: true

class CheckoutsController < ApplicationController
  before_action :user_carts

  def new
    @checkout = Checkout.new
  end

  def create
    ActiveRecord::Base.transaction do
      @checkout = Checkout.create!(checkout_params)
      current_cart.items.each do |item|
        checkout_product = CheckoutProduct.create!(checkout_id: @checkout.id, name: item.product.name, price: item.product.price, 
          description: item.product.description, category: item.product.category, quantity: item.quantity)
        checkout_product.image.attach(item.product.image.blob)
      end
      current_cart.items.destroy_all
    end
    redirect_to products_path, flash: { success: '購入ありがとうございます' }
  rescue => e
    redirect_to new_checkout_path, flash: { error: e.message }
  end

  private

  def checkout_params
    params.require(:checkout).permit(:first_name, :last_name, :username, :address, :address2, :email, :country, :state, :zip, :is_same_address, :is_save, :name_on_card, :credit_card_number, :expiration, :cvv).merge(cart_id: current_cart.id)
  end

  def user_carts
    @user_carts = current_cart.items.includes(:product)
    redirect_to products_path, flash: { danger: 'カートに商品を追加してください' } if @user_carts.empty?
  end
end
