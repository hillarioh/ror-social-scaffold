require 'rails_helper'

RSpec.describe Friendship, type: :model do
  let(:friend) { Friendship.create(user_id: 1, friend_id: 2) }
  context 'Check for validation of Friendship input' do
    it 'is valid with valid attributes' do
      expect(Friendship.create).to_not be_valid
    end

    it 'is not valid without an user id' do
      expect(Friendship.new(user_id: nil)).to_not be_valid
    end

    it 'is not valid without an friend id' do
      expect(Friendship.new(friend_id: nil)).to_not be_valid
    end

    it 'is valid without a status of friendship' do
      expect(friend.status).to eq false
    end
  end
end
