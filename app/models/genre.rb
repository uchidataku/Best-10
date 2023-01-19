# frozen_string_literal: true
# Genre
class Genre < ApplicationRecord
  belongs_to :genre_category

  has_many :ranking_genres
  has_many :rankings, through: :ranking_genres
  has_many :genre_followings
  has_many :accounts, through: :genre_followings

  validates :name, presence: true, uniqueness: true
end
