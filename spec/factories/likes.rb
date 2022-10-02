# frozen_string_literal: true
FactoryBot.define do
  factory :like do
    association :account
    association :item
  end
end
