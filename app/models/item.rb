# frozen_string_literal: true

# == Schema Information
#
# Table name: items
#
#  id           :bigint           not null, primary key
#  lock_version :integer
#  quantity     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  cart_id      :bigint           not null
#  product_id   :bigint           not null
#
# Indexes
#
#  index_items_on_cart_id     (cart_id)
#  index_items_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (cart_id => carts.id)
#  fk_rails_...  (product_id => products.id)
#
class Item < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  validates :quantity, presence: true

  delegate :name, :price, :description, :category, to: :product, prefix: true
end
