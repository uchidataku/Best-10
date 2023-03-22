# frozen_string_literal: true
# Item
class Item < ApplicationRecord
  belongs_to :ranking, counter_cache: true
  belongs_to :account

  has_many :likes

  has_one_attached :image

  validates :name, presence: true, uniqueness: { scope: :ranking_id }

  def image_url
    url_for(image)
  end
end
