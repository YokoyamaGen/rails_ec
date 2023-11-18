# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_cart

  private

  def set_cart
    return if session[:cart_id]

    new_cart = Cart.create!
    session[:cart_id] = new_cart.id
  end

  def current_cart
    @current_cart ||= Cart.find(session[:cart_id])
  end
end
