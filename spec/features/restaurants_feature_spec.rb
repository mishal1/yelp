require 'rails_helper'
require_relative 'user_helper'

feature 'Restaurants' do


  context 'no restaurants have been added' do

    before do 
     create_user('test@test.com')
    end

    scenario 'should display a prompt to add a restaurant' do
      visit '/restaurants'
      expect(page).to have_content 'No restaurants yet'
      expect(page).to have_link 'Add a restaurant'
    end

  end

  context 'with KFC in database' do

    before do
      create_user('test@test.com')
      @kfc = Restaurant.create(name: 'KFC')
    end

    context 'display restaurants' do

      scenario 'display restaurants' do
        visit '/restaurants'
        expect(page).to have_content 'KFC'
        expect(page).not_to have_content 'No restaurants yet'
      end

    end

    context 'creating restaurants' do

      scenario 'prompts user to fill out a form, then displays the new restaurant' do
        create_restaurant
        expect(page).to have_content 'McDonalds'
        expect(current_path).to eq '/restaurants'
      end

    end

    context 'viewing restaurants' do

    	scenario 'lets a user view a restaurant' do
    		visit '/restaurants'
    		click_link 'KFC'
    		expect(page).to have_content 'KFC'
    		expect(current_path).to eq "/restaurants/#{@kfc.id}"
    	end

    end

    context 'editing restaurants' do

      scenario "lets a user edit a restaurant" do
        create_restaurant
        visit '/restaurants'
        click_link 'Edit McDonalds'
        fill_in 'Name', with: 'McDonald'
        click_button 'Update Restaurant'
        expect(page).to have_content 'McDonald'
        expect(current_path).to eq '/restaurants'
      end

    end

    context 'deleting restaurants' do

    	scenario 'removes a restaurant when user clicks delete link' do
        create_restaurant
    		visit '/restaurants'
    		click_link 'Delete McDonalds'
    		expect(page).not_to have_content 'McDonalds'
    		expect(page).to have_content 'Restaurant deleted successfully'
    	end

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

      scenario 'does not let you submit a restaurant if it is not unique' do
        visit '/restaurants'
        click_link 'Add a restaurant'
        fill_in 'Name', with: 'KFC'
        click_button 'Create Restaurant'
        expect(page).to have_content 'error'
      end

    end

  end

  
end
