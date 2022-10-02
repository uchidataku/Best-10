# frozen_string_literal: true
# Account
class Account < ApplicationRecord
  include JWT::Authenticatable

  has_secure_password

  validates :username, uniqueness: true
  validates :password, length: { minimum: 6 }
  validates :is_system_admin, inclusion: [true, false]
end
