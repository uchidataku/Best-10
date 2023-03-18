# frozen_string_literal: true
FactoryBot.define do
  factory :genre_following do
    association :account
    association :genre
  end
end
