# frozen_string_literal: true

# == Schema Information
#
# Table name: carts
#
#  id                :bigint           not null, primary key
#  is_promotion_code :boolean          default(FALSE), not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class Cart < ApplicationRecord
  has_many :items, dependent: :destroy
  has_many :checkouts, dependent: :destroy
  has_many :products, through: :items
  has_many :promotion_code, dependent: :nullify

  def add_item(product_id:, quantity:)
    current_item = items.find_by(product_id:) || items.new(
      product_id:, quantity: 0
    )
    current_item.quantity += quantity.to_i
    current_item.save
  end

  def create_checkout_products!(checkout_id)
    checkout_product = nil
    items.each do |item|
      checkout_product = CheckoutProduct.create!(checkout_id:, name: item.product_name,
                                                 price: item.product_price, description: item.product_description,
                                                 category: item.product_category, quantity: item.quantity)
      checkout_product.image.attach(item.product.image.blob)
    end
    checkout_product
  end

  def total_price(promotion_code)
    total_price = items.eager_load(:product).inject(0) do |sum, user_cart|
      sum + (user_cart.product.price * user_cart.quantity)
    end

    return unless promotion_code

    discount_price = total_price - promotion_code.discount_amount
    discount_price.negative? ? 0 : discount_price
  end
end
