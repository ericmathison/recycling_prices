class AddPriceFieldsToRecyclingCenters < ActiveRecord::Migration
  def change
    add_column :recycling_centers, :paper_price, :decimal, precision: 8, scale: 2
    add_column :recycling_centers, :plastic_price, :decimal, precision: 8, scale: 2
    add_column :recycling_centers, :glass_price, :decimal, precision: 8, scale: 2
  end
end
