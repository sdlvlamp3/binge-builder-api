class Genre < ApplicationRecord
    has_many :msgenres
    has_many :movie_shows, through: :msgenres
end
