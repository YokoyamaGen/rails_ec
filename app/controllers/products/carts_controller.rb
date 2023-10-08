# frozen_string_literal: true

module Products
  class CartsController < ApplicationController
    def create
      count = params[:cart] ? params[:cart][:count].to_i : 1
      product = Product.find_by(id: params[:product_id])
      user_cart = current_user.carts.find_by(product_id: product.id)

      if user_cart
        user_cart.increment(:count, count)
        user_cart.save
      else
        current_user.carts.create!(product_id: product.id, count:)
      end

      redirect_to request.referer, flash: { success: 'カートに商品を追加しました' }
    end

    def destroy
      current_user.carts.find_by(product_id: params[:product_id]).destroy
      redirect_to request.referer, flash: { success: 'カートから商品を削除しました' }
    end
  end
end
