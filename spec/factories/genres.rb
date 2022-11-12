# frozen_string_literal: true
FactoryBot.define do
  factory :genre do
    association :genre_category
    sequence(:name) { |n| "ジャンル#{n}" }
  end
end
