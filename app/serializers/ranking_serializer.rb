# frozen_string_literal: true
# RankingSerializer
class RankingSerializer < BaseSerializer
  attributes :title, :genre

  belongs_to :creator
  has_many :items
end
