# frozen_string_literal: true

class ApplicationController < ActionController::Base
  private

  def current_carts
    Cart.where(id: session[:cart_id])
  end
end
