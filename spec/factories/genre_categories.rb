# frozen_string_literal: true
FactoryBot.define do
  factory :genre_category do
    sequence(:name) { |n| "カテゴリー#{n}" }
  end
end
