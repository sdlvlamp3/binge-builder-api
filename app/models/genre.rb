class Genre < ApplicationRecord
# Associations:
    has_many :msgenres
    has_many :movie_shows, through: :msgenres

# Validations:
    validates :genre_type, presence: true
end
