# frozen_string_literal: true

# == Schema Information
#
# Table name: promotion_codes
#
#  id                  :bigint           not null, primary key
#  code                :string           not null
#  discount_amount     :integer          not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  cart_id             :bigint
#  checkout_product_id :bigint
#
# Indexes
#
#  index_promotion_codes_on_cart_id              (cart_id)
#  index_promotion_codes_on_checkout_product_id  (checkout_product_id)
#
class PromotionCode < ApplicationRecord
  with_options presence: true do
    validates :code, length: { is: 7 }
    validates :discount_amount
  end
end
