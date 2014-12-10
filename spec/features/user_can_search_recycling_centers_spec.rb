require 'spec_helper'

feature 'A user can search recycling centers by zip code' do
  before do
    @recycling_center1 = create(:recycling_center)
    @recycling_center2 = create(:recycling_center2)
  end

  scenario 'on home page' do
    visit root_path

    fill_in 'recycling_center_search', with: '75505'
    click_on 'Search'
    expect(page).to have_content("Ted's Tin Factory")

    expect(page).to_not have_content("Al's Got Junk")
  end
end
