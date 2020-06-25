require 'rails_helper'

RSpec.describe FriendshipsController do
    describe "POST friendships#create" do
        it "should create a new story" do
          friendship = create(:user)
          login_as(user, scope: :user)
          visit new_stories_path
          fill_in "story_title", with: "Ruby on Rails"
          fill_in "story_content", with: "Text about Ruby on Rails"
          expect { click_button "Save" }.to change(Story, :count).by(1)
        end
    end
  end