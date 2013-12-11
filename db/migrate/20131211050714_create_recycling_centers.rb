class CreateRecyclingCenters < ActiveRecord::Migration
  def change
    create_table :recycling_centers do |t|
      t.string :name
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.string :telephone
      t.string :hours
      t.timestamps
    end
  end
end
