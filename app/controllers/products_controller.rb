# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).per(30)
  end

  def show
    @product = Product.find_by!(id: params[:id])
    @related_products = Product.new_related(@product)
    @cart = Cart.new
  end
end
