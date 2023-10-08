# frozen_string_literal: true

class DropActiveAdminComments < ActiveRecord::Migration[7.0]
  def change
    drop_table :active_admin_comments do
    end
  end
end
