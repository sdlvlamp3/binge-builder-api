class PlaylistItem < ApplicationRecord
  belongs_to :playlist
  belongs_to :movie_show
end
