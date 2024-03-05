class MovieShow < ApplicationRecord
# Associations:
    has_many :playlist_items
    has_many :msgenres
    has_many :genres, through: :msgenres

# Validations:
    validates :title, presence: true
    validates :description, presence: true
    validates :release_date, presence: true
end
