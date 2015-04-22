require 'spec_helper'

feature 'Basic navgation: ' do
  let!(:ny_center) { create :recycling_center, zip: 12534 }

  it 'allows the user to get back to the homepage' do
    visit root_path

    fill_in 'recycling_center_search', with: ny_center.zip

    click_on 'Search'

    expect(current_path).to_not eq(root_path)

    click_on 'Recycling Centers'

    expect(current_path).to eq(root_path)
  end
end
