# frozen_string_literal: true
# Ranking
class Ranking < ApplicationRecord
  before_create :set_suffix_title

  # Associations
  belongs_to :creator, class_name: 'Account'
  has_many :items, -> { order('likes_count DESC NULLS LAST') }, inverse_of: :ranking
  has_many :ranking_genres
  has_many :genres, through: :ranking_genres

  module SortBy
    POPULARITY = 'popularity' # 人気順
    NEWEST_TO_OLDEST = 'newest_to_oldest' # 新着順
  end

  # Validates
  validates :title, presence: true, uniqueness: true

  # Scopes
  scope :with_keyword, lambda { |keyword|
    where('title ILIKE ?', "%#{keyword}%")
  }

  scope :with_genre, lambda { |genre_id|
    joins(:ranking_genres).where(ranking_genres: { genre_id: genre_id })
  }

  scope :sort_by_params, lambda { |sort_by|
    case sort_by
    when SortBy::POPULARITY
      order('items_count DESC NULLS LAST')
    when SortBy::NEWEST_TO_OLDEST
      order(created_at: :desc)
    else
      fail ActionController::ParameterMissing, "sort_by: #{sort_by}"
    end
  }

  private

  def set_suffix_title
    self.title = "#{title} Best-10"
  end
end
