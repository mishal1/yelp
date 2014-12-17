require 'rails_helper'

feature 'restaurants' do

  context 'no restaurants have been added' do
    scenario 'should display a prompt to add a restaurant' do
      visit '/restaurants'
      expect(page).to have_content 'No restaurants yet'
      expect(page).to have_link 'Add a restaurant'
    end
  end

  context 'with KFC in database' do

    before do
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
        visit '/restaurants'
        click_link 'Add a restaurant'
        fill_in 'Name', with: 'McDonalds'
        click_button 'Create Restaurant'
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
        visit '/restaurants'
        click_link 'Edit KFC'
        fill_in 'Name', with: 'Kentucky Fried Chicken'
        click_button 'Update Restaurant'
        expect(page).to have_content 'Kentucky Fried Chicken'
        expect(current_path).to eq '/restaurants'
      end
    end

    context 'deleting restaurants' do
    	scenario 'removes a restaurant when user clicks delete link' do
    		visit '/restaurants'
    		click_link 'Delete KFC'
    		expect(page).not_to have_content 'KFC'
    		expect(page).to have_content 'Restaurant deleted successfully'
    	end
    end

  end
  
end
