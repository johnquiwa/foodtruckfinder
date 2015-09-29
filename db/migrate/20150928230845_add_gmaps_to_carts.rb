class AddGmapsToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :gmaps, :boolean
  end
end
