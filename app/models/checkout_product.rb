# frozen_string_literal: true

# == Schema Information
#
# Table name: checkout_products
#
#  id          :bigint           not null, primary key
#  category    :string           not null
#  description :string
#  name        :string           not null
#  price       :integer          not null
#  quantity    :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  checkout_id :bigint           not null
#
# Indexes
#
#  index_checkout_products_on_checkout_id  (checkout_id)
#
# Foreign Keys
#
#  fk_rails_...  (checkout_id => checkouts.id)
#
class CheckoutProduct < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates :category, presence: true
  validates :quantity, presence: true

  has_one_attached :image
end
