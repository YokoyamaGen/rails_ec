# frozen_string_literal: true

class CheckoutsController < ApplicationController
  def new
    @user_carts = current_carts.includes(:product)
  end
end
