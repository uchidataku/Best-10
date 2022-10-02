# frozen_string_literal: true
FactoryBot.define do
  factory :account do
    sequence(:username) { |n| "hoge_#{n}" }
    password { 'password' }

    trait :system_admin do
      is_system_admin { true }
    end
  end
end
