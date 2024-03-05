FactoryBot.define do
  factory :genre do
    genre_type { Faker::Book.genre }
  end
end
