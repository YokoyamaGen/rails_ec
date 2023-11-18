# frozen_string_literal: true

module CheckoutHelper
  def total_price(checkout_products)
    total_price = checkout_products.inject(0) do |sum, checkout_product|
      sum + (checkout_product.price * checkout_product.quantity)
    end

    checkout_products.each do |checkout_product|
      total_price -= checkout_product.promotion_code.discount_amount if checkout_product.promotion_code
    end
    total_price.negative? ? 0 : total_price
  end

  def price(checkout_product)
    checkout_product.price * checkout_product.quantity
  end
end
