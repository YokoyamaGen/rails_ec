# frozen_string_literal: true

class CheckoutsController < ApplicationController
  def new
    @user_carts = current_cart.items.includes(:product)
  end
end
