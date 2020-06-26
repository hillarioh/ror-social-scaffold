require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Check for validation of user input' do
    it 'is valid with valid attributes' do
      expect(User.create).to_not be_valid
    end

    it 'is not valid without a username' do
      expect(User.new(name: nil)).to_not be_valid
    end

    it 'is not valid without an email' do
      expect(User.new(email: nil)).to_not be_valid
    end
  end
end
