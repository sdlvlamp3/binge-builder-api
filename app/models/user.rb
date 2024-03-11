class User < ApplicationRecord

has_secure_password
    
# Associations
    has_many :playlists

# Validations
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true
end
