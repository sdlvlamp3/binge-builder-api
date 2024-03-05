require 'rails_helper'

RSpec.describe Playlist, type: :model do
  context 'with valid attributes' do
    it 'is valid' do
      playlist = build(:playlist)
      expect(playlist).to be_valid
    end

    it 'is invalid without a title' do
      playlist = build(:playlist, title: nil)
      expect(playlist).not_to be_valid
      expect(playlist.errors[:title]).to include("can't be blank")
    end

    it 'is invalid without a description' do
      playlist = build(:playlist, description: nil)
      expect(playlist).not_to be_valid
      expect(playlist.errors[:description]).to include("can't be blank")
    end

    it 'is invalid without a user' do
      playlist = build(:playlist, user: nil)
      expect(playlist).not_to be_valid
      expect(playlist.errors[:user]).to include("can't be blank")
    end
  end
end