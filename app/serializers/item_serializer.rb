# frozen_string_literal: true
# ItemSerializer
class ItemSerializer < BaseSerializer
  attributes :name, :likes_count

  has_many :likes
end
