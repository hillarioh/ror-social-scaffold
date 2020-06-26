require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'Users controller', type: :feature do
  before :each do
    l = User.new(name: 'example', email: 'example@gmail.com', password: '1234567')
    l.save
    m = User.new(name: 'niiazaly', email: 'niiazaly@gmail.com', password: '1234567')
    m.save
    d = User.new(name: 'okerioh', email: 'okerioh@gmail.com', password: '1234567')
    d.save
    f = Friendship.new(user: l, friend: m, status: false)
    f.save
    visit '/users/sign_in'
    within('form') do
      fill_in 'user[email]', with: 'niiazaly@gmail.com'
      fill_in 'user[password]', with: '1234567'
    end
    click_button 'Log in'
  end
  it 'rejects a friend request' do
    visit '/users'
    click_link 'reject'
    expect(page).to have_content ''
  end
  it 'accepts a friend request' do
    visit '/users'
    click_link 'accept'
    expect(page).to have_content ''
  end
  it 'sends a friend invite' do
    visit '/users'
    click_link 'invite'
    expect(page).to have_content 'Awaiting acceptance from user'
  end
end