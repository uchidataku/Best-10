# frozen_string_literal: true
# RankingSerializer
class RankingSerializer < BaseSerializer
  attributes :title, :items_count

  def items_count
    return 0 if object.items_count.nil?

    object.items_count
  end

  attribute :all_likes_count do
    object.items.pluck(:likes_count).compact.sum
  end

  belongs_to :creator
  has_many :genres
  has_many :items
end
