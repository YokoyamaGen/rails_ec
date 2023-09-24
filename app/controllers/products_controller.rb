# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find_by!(id: params[:id])
    @related_products = Product.where(category: @product.category).where.not(id: @product.id).order(created_at: :DESC)
  end
end
