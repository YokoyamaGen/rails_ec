# frozen_string_literal: true

module Products
  class CartsController < ApplicationController
    before_action :set_product

    def create
      if current_cart.add_item(product_id: @product.id, quantity: params[:cart][:quantity])
        redirect_to request.referer, flash: { success: 'カートに商品を追加しました' }
      else
        flash[:alert] = current_item.errors.full_messages.join("\n")
        redirect_to request.referer
      end
    end

    def destroy
      delete_cart_product = current_cart.items.find_by(product_id: @product.id)
      delete_cart_product.destroy
      redirect_to request.referer, flash: { success: 'カートから商品を削除しました' }
    end

    private

    def set_product
      @product = Product.find(params[:product_id])
    end
  end
end
