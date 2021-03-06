class RecyclingCenter < ApplicationRecord
  validates_presence_of :name, :street, :city, :state, :zip, :telephone, :hours
  has_paper_trail
end
