# frozen_string_literal: true

class RemoveProductIdFromCarts < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      change_table :carts, bulk: true do |t|
        dir.up do
          t.remove :product_id, :bigint
          t.remove :count, :integer
        end

        dir.down do
          t.column :product_id
          t.column :count
        end
      end
    end
  end
end
