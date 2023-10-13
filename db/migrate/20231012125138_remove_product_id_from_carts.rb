# frozen_string_literal: true

class RemoveProductIdFromCarts < ActiveRecord::Migration[7.0]
  def change
    change_table :carts, bulk: true do |t|
      t.remove_column :product_id, :bigint
      t.remove_column :count, :integer
    end
  end
end
