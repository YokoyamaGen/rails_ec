# frozen_string_literal: true

class AddLockVersionToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :lock_version, :integer
  end
end
