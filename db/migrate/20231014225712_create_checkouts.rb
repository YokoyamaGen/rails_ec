# frozen_string_literal: true

class CreateCheckouts < ActiveRecord::Migration[7.0]
  def change
    create_table :checkouts do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :username, null: false
      t.string :address, null: false
      t.string :address2
      t.string :email
      t.integer :country, null: false
      t.integer :prefecture_id, null: false
      t.string :zip, null: false
      t.boolean :is_same_address, null: false, default: false
      t.boolean :is_save, null: false, default: false
      t.string :name_on_card, null: false
      t.string :credit_card_number, null: false
      t.string :expiration, null: false
      t.integer :cvv, null: false
      t.references :cart, null: false, foreign_key: true

      t.timestamps
    end
  end
end
