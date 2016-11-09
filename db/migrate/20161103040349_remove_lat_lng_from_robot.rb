class RemoveLatLngFromRobot < ActiveRecord::Migration
  def change
  	remove_column :robots, :latitude
  	remove_column :robots, :longitude
  	add_column :robots, :current_location_id, :integer
  end
end
