# frozen_string_literal: true

# == Schema Information
#
# Table name: books
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_books_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Book < ApplicationRecord
  belongs_to :user

  scope :created_between, ->(from, to) { where(created_at: from..to) }
end
