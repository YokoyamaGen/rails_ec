# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :ip_address, null: false
      t.string :browser, null: false

      t.timestamps
    end
  end
end
