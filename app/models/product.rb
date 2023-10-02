# frozen_string_literal: true

class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates :category, presence: true

  has_one_attached :image

  scope :new_related, lambda { |product|
                        where(category: product.category).where.not(id: product.id).order(created_at: :DESC)
                      }
end
