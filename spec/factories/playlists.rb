FactoryBot.define do
  factory :playlist do
    title { Faker::Movie.title }
    description { Faker::Lorem.paragraph }
    user { build (:user) }
  end
end
