# frozen_string_literal: true
# ItemSerializer
class ItemSerializer < BaseSerializer
  attributes :name, :likes_count

  attribute :is_liked do
    if current_account
      object.likes.find_by(account: current_account).present?
    else
      false
    end
  end
end
