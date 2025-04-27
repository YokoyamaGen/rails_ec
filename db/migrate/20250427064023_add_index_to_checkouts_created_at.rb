# frozen_string_literal: true

class AddIndexToCheckoutsCreatedAt < ActiveRecord::Migration[7.0]
  def change
    add_index :checkouts, %i[cart_id created_at]
  end
end
