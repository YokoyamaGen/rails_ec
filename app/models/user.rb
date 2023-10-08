# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  browser    :string           not null
#  ip_address :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  validates :ip_address, presence: true
  validates :browser, presence: true

  has_many :carts, dependent: :destroy
end
