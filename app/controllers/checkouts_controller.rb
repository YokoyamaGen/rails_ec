# frozen_string_literal: true

class CheckoutsController < ApplicationController
  def new
    @user_carts = current_user.carts.includes(:product)
  end
end
