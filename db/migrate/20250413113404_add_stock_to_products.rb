# frozen_string_literal: true

class AddStockToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :stock, :integer
  end
end
