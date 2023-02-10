# frozen_string_literal: true
# Account
class Account < ApplicationRecord
  include JWT::Authenticatable

  has_secure_password

  has_many :rankings, foreign_key: :creator_id, inverse_of: :creator
  has_many :items
  has_many :likes
  has_many :genre_followings
  has_many :genres, through: :genre_followings

  validates :username, uniqueness: true, presence: true
  validates :password, length: { minimum: 6 }
  validates :is_system_admin, inclusion: [true, false]
end
