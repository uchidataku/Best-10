# frozen_string_literal: true
FactoryBot.define do
  factory :ranking do
    sequence(:title) { |n| "好きな漫画_#{n}" }

    association :creator, factory: :account
  end
end
