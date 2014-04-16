require 'spec_helper'

def step(name, &block)
  block_given? ? yield : pending
end

feature 'A user can add a recycling center' do
  scenario 'by visiting the new center page' do
    visit new_recycling_center_path

    step 'and filling in the form' do
      fill_in 'Name', with: "Al's Recycling"
      fill_in 'Street', with: '123 Old Stuff New Stuff Lane'
      fill_in 'Aluminum Price', with: "0.10"
      click_on 'Save'
    end

    step 'takes me to the newly created record' do
      expect(page).to have_content("Al's Recycling")
      expect(page).to have_content('123 Old Stuff New Stuff Lane')
      expect(page).to have_content('0.10')
    end
  end
end
