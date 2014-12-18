require 'rails_helper'
require_relative 'user_helper'

feature 'Users' do
  
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

    scenario "a user cannot leave a review unless they are signed in" do
      Restaurant.create(name: 'KFC')
      visit '/'
      expect(page).not_to have_link "Review KFC"
    end

  end

  context "user signed in on the homepage" do

    before do
      create_user('test@test.com')
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

    scenario "cannot edit a restaurant they didn't create" do
      visit '/'
      create_restaurant
      click_link 'Sign out'
      create_user('mishal@mishal.com')
      expect(page).not_to have_link 'Edit McDonalds'
    end

    scenario "cannot delete a restaurant they didn't create" do
      visit '/'
      create_restaurant
      click_link 'Sign out'
      create_user('mishal@mishal.com')
      expect(page).not_to have_link 'Delete McDonalds'
    end

  end

end