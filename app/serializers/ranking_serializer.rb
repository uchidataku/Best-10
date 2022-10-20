# frozen_string_literal: true
# RankingSerializer
class RankingSerializer < BaseSerializer
  attributes :title, :genre

  attribute :hoge do
    nil
  end

  belongs_to :creator
  has_many :items
end
