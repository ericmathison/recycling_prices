FactoryGirl.define do
  factory :recycling_center do
    name "Ted's Tin Factory"
    street '5839 Placid St.'
    city 'Foo Town'
    state 'CA'
    zip '75925'
    telephone '123-456-7890'
    hours '8 am to 4 pm'
    aluminum_price '0.40'
    paper_price '0.70'
    plastic_price '0.20'
    glass_price '0.30'
  end

  factory :recycling_center2, class: 'RecyclingCenter' do
    name "Al's Got Junk"
    street '2349 Garbage St.'
    city 'Foo City'
    state 'OR'
    zip '63573'
    telephone '098-765-4321'
    hours '9 am to 5 pm'
    aluminum_price '0.50'
    paper_price '0.80'
    plastic_price '0.30'
    glass_price '0.40'
  end
end
