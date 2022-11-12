# frozen_string_literal: true
# Ranking
class Ranking < ApplicationRecord
  before_create :set_suffix_title

  # Associations
  belongs_to :creator, class_name: 'Account'
  has_many :items, -> { order('likes_count DESC NULLS LAST') }, inverse_of: :ranking
  has_many :ranking_genres
  has_many :genres, through: :ranking_genres

  # module Genre
  #   UNSPECIFIED = 'unspecified'
  #   ENTERTAINMENT = 'entertainment' # エンタメ・趣味
  #   MUSIC = 'music' # 音楽
  #   NATURE = 'nature' # 自然
  #   SOCIETY = 'society' # 社会・時事
  #   POLITICAL_ECONOMY = 'political_economy' # 政治・経済
  #   ANIMAL = 'animal' # 動物
  #   FASHION = 'fashion' # ファッション
  #   LIFESTYLE = 'lifestyle' # ライフスタイル
  #   SPORT = 'sport' # スポーツ
  #   VEHICLE = 'vehicle' # 車・バイク
  #   BEAUTY_HEALTH = 'beauty_health' # 美容・健康
  #   FAMILY = 'family' # ファミリー・キッズ
  #   COOKING = 'cooking' # 料理
  #   GOURMET = 'gourmet' # グルメ
  #   BUSINESS = 'business' # ビジネス・教養
  #   IT = 'it' # IT
  #   TRAVEL = 'travel' # 旅行・お出かけ
  #   EDUCATION = 'education' # 教育
  # end

  module SortBy
    POPULARITY = 'popularity' # 人気順
    NEWEST_TO_OLDEST = 'newest_to_oldest' # 新着順
  end

  # enum genre: {
  #   unspecified: 0,
  #   entertainment: 10,
  #   music: 20,
  #   nature: 30,
  #   society: 40,
  #   political_economy: 50,
  #   animal: 60,
  #   fashion: 70,
  #   lifestyle: 80,
  #   sport: 90,
  #   vehicle: 100,
  #   beauty_health: 110,
  #   family: 120,
  #   cooking: 130,
  #   gourmet: 140,
  #   business: 150,
  #   it: 160,
  #   travel: 170,
  #   education: 180
  # }

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
