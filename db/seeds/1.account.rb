# frozen_string_literal: true

admin_account = Account.find_or_initialize_by(
  username: 'admin',
  is_system_admin: true
)
if admin_account.new_record?
  admin_account.update!(password: 'password', password_confirmation: 'password')
end

accounts = []
100.times.each do |n|
  account = Account.new(username: "testuser_#{n}")
  account.assign_attributes(password: 'password', password_confirmation: 'password')
  accounts << account
end
Account.import accounts
