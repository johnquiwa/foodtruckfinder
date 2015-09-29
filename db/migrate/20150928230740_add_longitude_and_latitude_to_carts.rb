class AddLongitudeAndLatitudeToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :longitude, :float
    add_column :carts, :latitude, :float
  end
end
