class MovieShow < ApplicationRecord
    has_many :playlist_items
    has_many :msgenres
    has_many :genres, through: :msgenres
end
