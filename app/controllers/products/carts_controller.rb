# frozen_string_literal: true

module Products
  class CartsController < ApplicationController
    before_action :set_product

    def create
      count = params[:cart][:count].to_i
      user_cart = current_carts.find_by(product_id: @product.id)
      increase_cart_count(user_cart, count)
    end

    def destroy
      delete_cart_product = current_carts.find_by(product_id: @product.id)
      session[:cart_id].delete(delete_cart_product.id)
      delete_cart_product.destroy
      redirect_to request.referer, flash: { success: 'カートから商品を削除しました' }
    end

    private

    def set_product
      @product = Product.find(params[:product_id])
    end

    def increase_cart_count(user_cart, count)
      if user_cart.present?
        user_cart.increment(:count, count)
      else
        user_cart = Cart.new(product_id: @product.id, count:)
      end

      if user_cart.save
        session[:cart_id] = [] if session[:cart_id].nil?
        session[:cart_id].push(user_cart.id) if session[:cart_id].exclude?(user_cart.id)
        redirect_to request.referer, flash: { success: 'カートに商品を追加しました' }
      else
        flash[:alert] = user_cart.errors.full_messages.join("\n")
        redirect_to request.referer
      end
    end
  end
end
