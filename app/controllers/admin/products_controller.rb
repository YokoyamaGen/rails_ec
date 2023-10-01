# frozen_string_literal: true

module Admin
  class ProductsController < ApplicationController
    before_action :basic_auth
    before_action :set_production, only: %i[edit update destroy]
    layout 'admin'

    def index
      @products = Product.all.order('id')
    end

    def new
      @product = Product.new
    end

    def create
      @product = Product.new(product_params)
      if @product.save

        redirect_to admin_products_path, flash: { success: '商品を登録しました' }
      else
        render 'new', status: :unprocessable_entity
      end
    end

    def edit; end

    def update
      if @product.update(product_params)
        redirect_to admin_products_path, flash: { success: '商品を更新しました' }
      else
        render 'edit', status: :unprocessable_entity
      end
    end

    def destroy
      @product.image.purge
      @product.destroy
      redirect_to admin_products_path, flash: { success: '商品を削除しました' }, status: :see_other
    end

    private

    def basic_auth
      authenticate_or_request_with_http_basic do |user, password|
        user == Rails.application.credentials.manage[:basic_auth_name] &&
          password == Rails.application.credentials.manage[:basic_auth_password]
      end
    end

    def set_production
      @product = Product.find_by!(id: params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :price, :description, :category, :image)
    end
  end
end
