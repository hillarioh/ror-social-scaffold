require 'rails_helper'

RSpec.describe Friendship, type: :model do
    let(:friend) { Friendship.create(invitor_id: 1,invitee_id: 2) }
  context 'Check for validation of Friendship input' do
    it 'is valid with valid attributes' do
      expect(Friendship.create).to_not be_valid
    end

    it 'is not valid without an invitor id' do
      expect(Friendship.new(invitor: nil)).to_not be_valid
    end

    it 'is not valid without an invitee id' do
       expect(Friendship.new(invitee: nil)).to_not be_valid
    end

    it 'is valid without a status of friendship' do
        expect(friend.status).to eq false
    end
  end
  

end