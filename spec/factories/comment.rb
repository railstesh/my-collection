FactoryBot.define do
  factory :comment do
    association :image
    body { Faker::Lorem.paragraph }
  end
end
