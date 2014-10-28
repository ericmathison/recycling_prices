require 'spec_helper'

feature 'A user can view a list of recycling centers' do
  before do
    @recycling_center1 = create(:recycling_center)
    @recycling_center2 = create(:recycling_center2)
  end

  scenario 'both recycling centers are displayed' do
    visit root_path

    ["Ted's Tin Factory", '5839 Placid St.', 'Foo Town', 'CA', '75925',
     '123-456-7890', '8 am to 4 pm', '0.40', '0.70', '0.20',
     '0.30'].each do |text|
      expect(page).to have_content(text)
    end

    ["Al's Got Junk", '2349 Garbage St.', 'Foo City', 'OR', '63573',
     '098-765-4321', '9 am to 5 pm', '0.50', '0.80', '0.30',
     '0.40'].each do |text|
      expect(page).to have_content(text)
    end
  end
end
