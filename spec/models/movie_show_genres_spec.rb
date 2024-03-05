require 'rails_helper'

RSpec.describe MovieShow_Genres, type: :model do
  context 'with valid attributes' do
    it 'is valid' do
      movie_show_genres = build(:movie_show_genres)
      expect(movie_show_genres).to be_valid
    end
  end
end
