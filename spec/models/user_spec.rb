require 'rails_helper'

RSpec.describe User, type: :model do
  context 'with valid attributes' do
    it 'is valid' do
      user = build(:user)
      expect(user).to be_valid
    end

    it 'is invalid without a username' do
      user = build(:user, username: nil)
      expect(user).not_to be_valid
      expect(user.errors[:username]).to include("can't be blank")
    end

    it 'is invalid without a email' do
      user = build(:user, email: nil)
      expect(user).not_to be_valid
      expect(user.errors[:email]).to include("can't be blank")
    end

    it 'is invalid without a password' do
      user = build(:user, password: nil)
      expect(user).not_to be_valid
      expect(user.errors[:password]).to include("can't be blank")
    end
  end

  context 'with unique attributes' do
    it 'is invalid with a duplicate email' do
      create(:user, email: "john@example.com")
      user = build(:user, email: "john@example.com")
      expect(user).not_to be_valid
      expect(user.errors[:email]).to include("has already been taken")
    end

    it 'is invalid with a duplicate username' do
      create(:user, username: "john.example")
      user = build(:user, username: "john.example")
      expect(user).not_to be_valid
      expect(user.errors[:username]).to include("has already been taken")
    end
  end
end
