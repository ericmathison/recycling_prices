class AddAlumniumPriceToRecyclingCenters < ActiveRecord::Migration
  def change
    add_column :recycling_centers, :aluminum_price, :decimal, precision: 8, scale: 2
  end
end
