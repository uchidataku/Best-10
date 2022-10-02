# frozen_string_literal: true
# Like
class Like < ApplicationRecord
  belongs_to :account
  belongs_to :item

  validates :account_id, uniqueness: { scope: :item_id }
end
