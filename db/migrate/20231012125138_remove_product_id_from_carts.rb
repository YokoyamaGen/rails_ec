# frozen_string_literal: true

class RemoveProductIdFromCarts < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      change_table :carts, bulk: true do |t|
        dir.up do
          t.remove :product_id
          t.remove :count
        end

        dir.down do
          t.column :product_id, :bigint
          t.column :count, :integer
        end
      end
    end
  end
end
