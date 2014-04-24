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
    paper_price '0.7'
    plastic_price '0.20'
    glass_price '0.30'
  end
end
