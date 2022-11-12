# frozen_string_literal: true
# GenreCategorySerializer
class GenreCategorySerializer < BaseSerializer
  attributes :name

  has_many :genres
end
