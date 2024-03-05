class PlaylistItem < ApplicationRecord
# Associations:
  belongs_to :playlist
  belongs_to :movie_show

# Validations:
  validates :playlist, presence: true
  validates :movie_show, presence: true
end
