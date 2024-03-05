FactoryBot.define do
  factory :movie_show do
    title { Faker::Movie.title }
    description { Faker::Lorem.paragraph }
    release_date { "2024-03-03 13:57:48" }
  end
end
