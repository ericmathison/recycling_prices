class RecyclingCenter < ActiveRecord::Base
  validates_presence_of :name, :street, :city, :state, :zip, :telephone, :hours
end
