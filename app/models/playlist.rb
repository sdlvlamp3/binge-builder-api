class Playlist < ApplicationRecord
# Associations:  
  belongs_to :user
  has_many :playlist_items

# Validations:
  validates :title, presence: true
  validates :description, presence: true
  validates :user, presence: true
end
