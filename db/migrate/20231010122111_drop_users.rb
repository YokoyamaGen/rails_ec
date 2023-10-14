# frozen_string_literal: true

class DropUsers < ActiveRecord::Migration[7.0]
  def change
    drop_table :users do |t|
      t.string :ip_address, null: false
      t.string :browser, null: false

      t.timestamps
    end
  end
end
