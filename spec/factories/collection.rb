FactoryBot.define do
  factory :collection do
    name { Faker::Lorem.sentence }
    thumbnail_url { "https://picsum.photos/200/300/?blur" }
    description { Faker::Lorem.paragraph }
  end
end
