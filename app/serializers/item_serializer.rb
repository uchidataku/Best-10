# frozen_string_literal: true
# ItemSerializer
class ItemSerializer < BaseSerializer
  attributes :name, :likes_count

  def likes_count
    return 0 if object.likes_count.nil?

    object.likes_count
  end

  attribute :is_liked do
    if current_account
      object.likes.find_by(account: current_account).present?
    else
      false
    end
  end
end
