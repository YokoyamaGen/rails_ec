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
#  stock       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_products_on_category_and_created_at  (category,created_at)
#
class Product < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :price
    validates :category
  end

  has_one_attached :image
  has_many :items, dependent: :destroy

  scope :new_related, lambda { |product|
                        where(category: product.category).where.not(id: product.id).order(created_at: :DESC).limit(10)
                      }
end
