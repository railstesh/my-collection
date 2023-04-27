FactoryBot.define do
  factory :image do
    title { Faker::Lorem.sentence }
    url { "https://picsum.photos/200/300/?blur" }
    description { Faker::Lorem.paragraph }
    copyright { Faker::Name.name }

    trait :with_collection do
      association :collection
    end
  end
end
