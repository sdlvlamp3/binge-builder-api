require 'rails_helper'

RSpec.describe PlaylistItem, type: :model do
  context 'with valid attributes' do
    it 'is valid' do
      playlist_item = build(:playlist_item)
      expect(playlist_item).to be_valid
    end   
  end
end
