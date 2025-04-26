class AddIndexToProductsOnCategoryAndCreatedAt < ActiveRecord::Migration[7.0]
  def change
    add_index :products, [:category, :created_at]
  end
end
