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
  with_options presence: true do
    validates :name
    validates :price
    validates :category
    validates :quantity
  end

  has_one_attached :image
  belongs_to :checkout
  has_one :promotion_code, dependent: :nullify
end
