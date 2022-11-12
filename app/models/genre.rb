# frozen_string_literal: true
# Genre
class Genre < ApplicationRecord
  belongs_to :genre_category

  has_many :ranking_genres
  has_many :rankings, through: :ranking_genres

  validates :name, presence: true, uniqueness: true
end
