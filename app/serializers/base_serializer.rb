# frozen_string_literal: true
# BaseSerializer
class BaseSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :updated_at

  def viewer_can_update
    current_ability ? current_ability.can?(:update, object) : false
  end

  def viewer_can_delete
    current_ability ? current_ability.can?(:delete, object) : false
  end

  def current_account
    return nil unless try(:context)

    context[:current_account]
  end

  def current_ability
    return nil unless try(:context)

    context[:current_ability]
  end
end
