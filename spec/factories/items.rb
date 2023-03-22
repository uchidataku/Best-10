# frozen_string_literal: true
FactoryBot.define do
  factory :item do
    sequence(:name) { |n| "OnePiece_#{n}" }

    association :ranking
    association :account

    trait :with_image do
      after(:build) do |item|
        item.image.attach(
          io: File.open('spec/fixtures/example.jpg'),
          filename: 'example.jpg',
          content_type: 'image/jpeg'
        )
      end
    end
  end
end
