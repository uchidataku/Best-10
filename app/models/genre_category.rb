# frozen_string_literal: true
# GenreCategory
class GenreCategory < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
