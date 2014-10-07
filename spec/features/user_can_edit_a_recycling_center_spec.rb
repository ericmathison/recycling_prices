require 'spec_helper'

feature 'A user can edit an existing recycling center' do
  before do
    visit edit_recycling_center_path(create(:recycling_center))
  end

  scenario 'by visiting the edit page' do
    step 'and changing values in the form' do
      fill_in 'Name', with: "The Other Guy's Factory"
      fill_in 'Street', with: '500 Long St.'
      fill_in 'City', with: 'Another Town'
      select 'Alaska', from: 'recycling_center_state'
      fill_in 'Zip', with: '99757'
      fill_in 'Telephone', with: '110-395-3982'
      fill_in 'Hours', with: '5 am to 1 pm'
      fill_in 'Aluminum Price', with: '0.29'
      fill_in 'Paper Price', with: '0.03'
      fill_in 'Plastic Price', with: '0.10'
      fill_in 'Glass Price', with: '0.21'
      click_on 'Save'
    end

    step 'takes me to the updated record' do
      ["The Other Guy's Factory", '500 Long St.', 'Another Town', 'AK',
        '99757', '110-395-3982', '5 am to 1 pm', '0.29', '0.03', '0.10',
        '0.21'].each do |text|
        expect(page).to have_content(text)
      end
    end
  end

  scenario 'appropriate fields are not filled out' do
    step "clear all fields" do

      page.all(:xpath, '//input').each do |field|
        field.set '' unless field[:type].in?(%w[hidden submit])
      end

      click_on 'Save'
    end

    step 'error message is given' do
      expect(page).to have_content("Name can't be blank")
      expect(page).to have_content("Street can't be blank")
      expect(page).to have_content("City can't be blank")
      expect(page).to have_content("Zip can't be blank")
    end
  end
end
