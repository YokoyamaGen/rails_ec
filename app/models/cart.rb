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

  def add_item(product_id:, quantity:)
    current_item = items.find_by(product_id:) || items.new(
      product_id:, quantity: 0
    )
    current_item.quantity += quantity.to_i
    current_item.save
  end
end
