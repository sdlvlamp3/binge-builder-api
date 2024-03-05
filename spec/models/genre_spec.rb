require 'rails_helper'

RSpec.describe Genre, type: :model do
  context 'with valid attributes' do
    it 'is valid' do
      genre = build(:genre)
      expect(genre).to be_valid
    end

    it 'is invalid without a genre type' do
      genre = build(:genre, genre_type: nil)
      expect(genre).not_to be_valid
      expect(genre.errors[:genre_type]).to include("can't be blank")
    end
  end
end