class MovieShow_Genres < ApplicationRecord
# Associations:
  belongs_to :movie_show
  belongs_to :genre

# Validations:
  validates :movie_show_id, presence: true
  validates :genre_id, presence: true
end
