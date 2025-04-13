class RemoveLockVersionFromItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :items, :lock_version, :integer
  end
end
