# frozen_string_literal: true
# AccountSerializer
class AccountSerializer < BaseSerializer
  attributes :username, :is_system_admin

  has_many :rankings
end
