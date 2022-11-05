# frozen_string_literal: true
# RankingSerializer
class RankingSerializer < BaseSerializer
  attributes :title, :genre, :items_count

  attribute :all_likes_count do
    object.items.pluck(:likes_count).compact.sum
  end

  belongs_to :creator
  has_many :items
end
