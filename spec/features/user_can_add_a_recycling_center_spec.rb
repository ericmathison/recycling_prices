require 'spec_helper'

feature 'A user can add a recycling center' do
  before do
    visit root_path
    click_on 'Add a new recycling center'
  end

  scenario 'by visiting the new center page' do
    step 'and filling in the form' do
      fill_in 'Name', with: "Al's Recycling"
      fill_in 'Street', with: '123 Long Ln.'
      fill_in 'City', with: 'Pasadena'
      select 'California', from: 'State'
      fill_in 'Zip', with: '91107'
      fill_in 'Telephone', with: '626-123-1234'
      fill_in 'Hours', with: '9 to 5'
      fill_in 'Aluminum Price', with: "0.30"
      fill_in 'Paper Price', with: "0.05"
      fill_in 'Plastic Price', with: "0.10"
      fill_in 'Glass Price', with: "0.20"
      click_on 'Save'
    end

    step 'takes me to the newly created record' do
      ["Al's Recycling", '123 Long Ln.', 'Pasadena', 'CA', '91107',
       '626-123-1234', '9 to 5', '0.30', '0.05', '0.10', '0.20'].each do |text|
        expect(page).to have_content(text)
      end
    end
  end

  scenario 'by visiting the new center page' do
    step 'and filling in all fileds except paper price' do
      fill_in 'Name', with: "Al's Recycling"
      fill_in 'Street', with: '123 Long Ln.'
      fill_in 'City', with: 'Pasadena'
      select 'California', from: 'State'
      fill_in 'Zip', with: '91107'
      fill_in 'Telephone', with: '626-123-1234'
      fill_in 'Hours', with: '9 to 5'
      fill_in 'Aluminum Price', with: '0.30'
      fill_in 'Paper Price', with: ''
      fill_in 'Plastic Price', with: '0.10'
      fill_in 'Glass Price', with: '0.20'
      click_on 'Save'
    end

    step 'takes me to the newly created record' do
      ["Al's Recycling", '123 Long Ln.', 'Pasadena', 'CA', '91107',
       '626-123-1234', '9 to 5', '0.30', '0.10', '0.20'].each do |text|
        expect(page).to have_content(text)
      end
    end
  end

  scenario 'unless appropriate fields are not filled out' do
    step "don't fill out any fields" do
      click_on 'Save'
    end

    step 'error message is given' do
      expect(page).to have_content("Name can't be blank")
      expect(page).to have_content("Street can't be blank")
      expect(page).to have_content("City can't be blank")
      expect(page).to have_content("State can't be blank")
      expect(page).to have_content("Zip can't be blank")
      expect(page).to have_content("Telephone can't be blank")
      expect(page).to have_content("Hours can't be blank")
    end
  end
end
