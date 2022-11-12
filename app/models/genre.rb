# frozen_string_literal: true
# Genre
class Genre < ApplicationRecord
  belongs_to :genre_category

  validates :name, presence: true, uniqueness: true
end
