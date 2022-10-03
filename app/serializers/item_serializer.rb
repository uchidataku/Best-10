# frozen_string_literal: true
# ItemSerializer
class ItemSerializer < BaseSerializer
  attributes :name

  has_many :likes
end
