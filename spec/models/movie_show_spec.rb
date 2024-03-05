require 'rails_helper'

RSpec.describe MovieShow, type: :model do
  context 'with valid attributes' do
    it 'is valid' do
      movie_show = build(:movie_show)
      expect(movie_show).to be_valid
    end

    it 'is invalid without a title' do
      movie_show = build(:movie_show, title: nil)
      expect(movie_show).not_to be_valid
      expect(movie_show.errors[:title]).to include("can't be blank")
    end

    it 'is invalid without a description' do
      movie_show = build(:movie_show, description: nil)
      expect(movie_show).not_to be_valid
      expect(movie_show.errors[:description]).to include("can't be blank")
    end
  end
end
