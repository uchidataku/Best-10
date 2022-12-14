# frozen_string_literal: true
# GenreCategory
class GenreCategory < ApplicationRecord
  has_many :genres

  validates :name, presence: true, uniqueness: true
end
