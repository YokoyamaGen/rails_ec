# == Schema Information
#
# Table name: checkouts
#
#  id                 :bigint           not null, primary key
#  address            :string           not null
#  address2           :string
#  country            :integer          not null
#  credit_card_number :integer          not null
#  cvv                :integer          not null
#  email              :string
#  expiration         :string           not null
#  first_name         :string           not null
#  is_same_address    :boolean          default(FALSE), not null
#  is_save            :boolean          default(FALSE), not null
#  last_name          :string           not null
#  name_on_card       :string           not null
#  state              :integer          not null
#  username           :string           not null
#  zip                :string           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  cart_id            :bigint           not null
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

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true
  validates :address, presence: true
  validates :country, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  validates :name_on_card, presence: true
  validates :credit_card_number, presence: true
  validates :expiration, presence: true
  validates :cvv, presence: true

end
