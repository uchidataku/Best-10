# frozen_string_literal: true
# Ranking
class Ranking < ApplicationRecord
  before_create :set_suffix_title

  belongs_to :creator, class_name: 'Account'

  has_many :items, -> { order(likes_count: :desc) }

  module Genre
    UNSPECIFIED = 'unspecified'
    ENTERTAINMENT = 'entertainment' # エンタメ・趣味
    MUSIC = 'music' # 音楽
    NATURE = 'nature' # 自然
    SOCIETY = 'society' # 社会・時事
    POLITICAL_ECONOMY = 'political_economy' # 政治・経済
    ANIMAL = 'animal' # 動物
    FASHION = 'fashion' # ファッション
    LIFESTYLE = 'lifestyle' # ライフスタイル
    SPORT = 'sport' # スポーツ
    VEHICLE = 'vehicle' # 車・バイク
    BEAUTY_HEALTH = 'beauty_health' # 美容・健康
    FAMILY = 'family' # ファミリー・キッズ
    COOKING = 'cooking' # 料理
    GOURMET = 'gourmet' # グルメ
    BUSINESS = 'business' # ビジネス・教養
    IT = 'it' # IT
    TRAVEL = 'travel' # 旅行・お出かけ
    EDUCATION = 'education' # 教育
  end

  enum genre: {
    unspecified: 0,
    entertainment: 10,
    music: 20,
    nature: 30,
    society: 40,
    political_economy: 50,
    animal: 60,
    fashion: 70,
    lifestyle: 80,
    sport: 90,
    vehicle: 100,
    beauty_health: 110,
    family: 120,
    cooking: 130,
    gourmet: 140,
    business: 150,
    it: 160,
    travel: 170,
    education: 180
  }

  validates :title, presence: true, uniqueness: true

  private

  def set_suffix_title
    self.title = "#{title} Best-10"
  end
end
