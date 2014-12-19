require 'rails_helper'

feature 'endorsing reviews' do
  
  before do
    kfc = Restaurant.create(name: 'KFC')
    kfc.reviews.create(rating: 3, thoughts: 'It was an abomination')
    create_user('test@test.com')
    visit '/restaurants'
  end

  scenario 'a restaurant has no endorsements when created' do
    expect(page).to have_content '0 endorsements'
  end

  # scenario 'if a restaurant has 1 endorsement then the word endorsement will be singular', js: true do
  #   click_link 'Endorse KFC'
  #   expect(page).to have_content '1 endorsement'
  # end

  # scenario 'a user can endorse a review, which updates the review endorsement count' do
  #   click_link 'Endorse KFC'
  #   visit '/restaurants'
  #   create_user('mishal@mishal.com')
  #   click_link "Endorse KFC"
  #   expect(page).to have_content '2 endorsements'
  # end

end