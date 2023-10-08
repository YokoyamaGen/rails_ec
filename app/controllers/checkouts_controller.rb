# frozen_string_literal: true

class CheckoutsController < ApplicationController
  def index
    @user_carts = current_user.carts.includes(:product)
  end
end
