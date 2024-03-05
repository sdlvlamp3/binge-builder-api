FactoryBot.define do
  factory :MovieShow_Genres do
    movie_show { build(:movie_show) }
    genre { build(:genre) }
  end
end
