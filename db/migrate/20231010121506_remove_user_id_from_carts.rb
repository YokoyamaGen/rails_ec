# frozen_string_literal: true

class RemoveUserIdFromCarts < ActiveRecord::Migration[7.0]
  def change
    remove_column :carts, :user_id, :bigint
  end
end
