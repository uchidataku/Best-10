# frozen_string_literal: true
FactoryBot.define do
  factory :ranking_genre do
    association :ranking
    association :genre
  end
end
