# frozen_string_literal: true

class AddIsPromotionCodeToCarts < ActiveRecord::Migration[7.0]
  def change
    add_column :carts, :is_promotion_code, :boolean, null: false, default: false
  end
end
