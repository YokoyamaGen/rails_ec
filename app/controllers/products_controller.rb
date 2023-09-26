# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find_by!(id: params[:id])
    @related_products = Product.new_related(@product)
  end
end
