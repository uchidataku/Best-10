# frozen_string_literal: true
# Item
class Item < ApplicationRecord
  belongs_to :ranking

  validates :name, presence: true, uniqueness: { scope: :ranking_id }
end
