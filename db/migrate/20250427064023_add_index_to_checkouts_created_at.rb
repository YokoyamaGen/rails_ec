class AddIndexToCheckoutsCreatedAt < ActiveRecord::Migration[7.0]
  def change
    add_index :checkouts, [:cart_id, :created_at]
  end
end
