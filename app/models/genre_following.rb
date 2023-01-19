# frozen_string_literal: true
# GenreFollowing
class GenreFollowing < ApplicationRecord
  belongs_to :account
  belongs_to :genre

  validates :account_id, uniqueness: { scope: :genre_id }
end
