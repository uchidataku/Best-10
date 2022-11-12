# frozen_string_literal: true
# RankingGenre
class RankingGenre < ApplicationRecord
  belongs_to :ranking
  belongs_to :genre

  validates :ranking_id, uniqueness: { scope: :genre_id }
end
