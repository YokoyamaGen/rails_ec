# frozen_string_literal: true

# == Schema Information
#
# Table name: checkouts
#
#  id                 :bigint           not null, primary key
#  address            :string           not null
#  address2           :string
#  country            :integer          not null
#  credit_card_number :string           not null
#  cvv                :integer          not null
#  email              :string
#  expiration         :string           not null
#  first_name         :string           not null
#  is_same_address    :boolean          default(FALSE), not null
#  is_save            :boolean          default(FALSE), not null
#  last_name          :string           not null
#  name_on_card       :string           not null
#  username           :string           not null
#  zip                :string           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  cart_id            :bigint           not null
#  prefecture_id      :integer          not null
#
# Indexes
#
#  index_checkouts_on_cart_id  (cart_id)
#
# Foreign Keys
#
#  fk_rails_...  (cart_id => carts.id)
#
class Checkout < ApplicationRecord
  belongs_to :cart
  has_many :checkout_products, dependent: :destroy
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true
  validates :address, presence: true
  validates :country, presence: true
  validates :prefecture_id, presence: true
  validates :zip, presence: true
  validates :name_on_card, presence: true
  validates :credit_card_number, presence: true, length: { minimum: 16 }
  validates :expiration, presence: true
  validates :cvv, presence: true

  def create_checkout_product(current_cart)
    ActiveRecord::Base.transaction do
      current_cart.items.each do |item|
        checkout_product = CheckoutProduct.create!(checkout_id: id, name: item.product_name,
                                                   price: item.product_price, description: item.product_description,
                                                   category: item.product_category, quantity: item.quantity)
        checkout_product.image.attach(item.product.image.blob)
      end
    end
  end
end
