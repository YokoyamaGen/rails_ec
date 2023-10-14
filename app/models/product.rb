# frozen_string_literal: true

# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  category    :string           not null
#  description :string
#  name        :string           not null
#  price       :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates :category, presence: true

  has_one_attached :image
  has_many :items, dependent: :destroy

  scope :new_related, lambda { |product|
                        where(category: product.category).where.not(id: product.id).order(created_at: :DESC)
                      }
end
