# frozen_string_literal: true

module CartsHelper
  def total_price(user_carts)
    user_carts.inject(0) do |sum, user_cart|
      sum + (user_cart.product.price * user_cart.count)
    end
  end
end
