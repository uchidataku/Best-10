# frozen_string_literal: true
FactoryBot.define do
  factory :item do
    sequence(:name) { |n| "OnePiece_#{n}" }

    association :ranking
    association :account
  end
end
