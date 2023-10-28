class CreateCheckoutProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :checkout_products do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.string :description
      t.string :category, null: false
      t.integer :quantity, null: false
      t.references :checkout, null: false, foreign_key: true

      t.timestamps
    end
  end
end