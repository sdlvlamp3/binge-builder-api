FactoryBot.define do
  factory :movie_show do
    title { Faker::Movie.title }
    description { Faker::Lorem.paragraph }
    release_date { Faker::Date.backward(days: 30) }
  end
end
