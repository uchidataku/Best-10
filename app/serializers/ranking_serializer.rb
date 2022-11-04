# frozen_string_literal: true
# RankingSerializer
class RankingSerializer < BaseSerializer
  attributes :title, :genre, :items_count

  def all_likes_count
    object.items.pluck(:likes_count).sum
  end

  belongs_to :creator
  has_many :items
end
