class Msgenre < ApplicationRecord
  belongs_to :movie_show
  belongs_to :genre
end
