# frozen_string_literal: true

# == Schema Information
#
# Table name: carts
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Cart < ApplicationRecord
  has_many :items, dependent: :destroy
  has_many :checkouts, dependent: :destroy
  has_many :products, through: :items

  def add_item(product_id:, quantity:)
    current_item = items.find_by(product_id:) || items.new(
      product_id:, quantity: 0
    )
    current_item.quantity += quantity.to_i
    current_item.save
  end

  def create_checkout_products!(checkout_id)
    items.each do |item|
      checkout_product = CheckoutProduct.create!(checkout_id:, name: item.product_name,
                                                 price: item.product_price, description: item.product_description,
                                                 category: item.product_category, quantity: item.quantity)
      checkout_product.image.attach(item.product.image.blob)
    end
  end
end
