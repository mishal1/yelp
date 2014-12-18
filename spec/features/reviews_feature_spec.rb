require 'rails_helper'
require_relative 'user_helper'

feature 'Reviewing' do

  before do
    Restaurant.create(name: 'KFC')
    create_user('test@test.com')
  end

  scenario 'Allows user to leave a review using a form' do
    leave_review('so so', '3')
    click_button 'Leave Review'
    expect(current_path).to eq '/restaurants'
    expect(page).to have_content 'so so'
  end

  context 'an invalid restaurant' do
    scenario 'does not let you submit a name that is too short' do
      visit '/restaurants'
      click_link 'Add a restaurant'
      fill_in 'Name', with: 'kf'
      click_button 'Create Restaurant'
      expect(page).not_to have_css 'h2', text: 'kf'
      expect(page).to have_content 'error'
    end
  end

  scenario 'displays an avergae rating for all reviews' do
    leave_review('so so', '3')
    # click_button 'Sign out'
    # create_user('mishal@mishal.com')
    leave_review('Great', '5')
    expect(page).to have_content 'Average Rating: 4'
  end


end