FactoryBot.define do
  factory :playlist_item do
    playlist { build (:playlist) }
    movie_show { build (:movie_show) }
  end
end
