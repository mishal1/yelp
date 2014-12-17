require 'rails_helper'
require_relative 'user_helper'

feature 'users' do
  
  context "user not signed in and on the homepage" do

    scenario "should see a 'sign in' link and a 'sign up' link" do
      visit '/'
      expect(page).to have_link 'Sign in'
      expect(page).to have_link 'Sign up'
    end

    scenario "should not see 'sign out' link" do
      visit '/'
      expect(page).not_to have_link 'Sign out'
    end

    scenario "user shouldn't be able to add a restaurant" do
      visit '/'
      expect(page).not_to have_link 'Add a restaurant'
    end

  end

  context "user signed in on the homepage" do

    before do
      create_user
    end

    scenario "should see 'sign out' link" do
      visit '/'
      expect(page).to have_link 'Sign out'
    end

    scenario "should not see a 'sign in' link and a 'sign up' link" do
      visit '/'
      expect(page).not_to have_link 'Sign in'
      expect(page).not_to have_link 'Sign up'
    end

  end

end