# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = Product.preload(image_attachment: :blob).page(params[:page]).per(20)
  end

  def show
    @product = Product.find_by!(id: params[:id])
    @related_products = Product.new_related(@product)
    @cart = Cart.new
  end
end
