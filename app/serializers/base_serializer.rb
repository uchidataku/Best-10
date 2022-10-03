# frozen_string_literal: true
# BaseSerializer
class BaseSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :updated_at
end
