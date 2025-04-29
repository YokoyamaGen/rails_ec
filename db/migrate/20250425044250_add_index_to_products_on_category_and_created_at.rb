# frozen_string_literal: true

class AddIndexToProductsOnCategoryAndCreatedAt < ActiveRecord::Migration[7.0]
  def change
    add_index :products, %i[category created_at]
  end
end
