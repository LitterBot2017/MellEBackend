class AddBoundaryToRobot < ActiveRecord::Migration
  def change
  	add_column :robots, :boundary_start_lat, :decimal
  	add_column :robots, :boundary_start_lng, :decimal
  	add_column :robots, :boundary_end_lat, :decimal
  	add_column :robots, :boundary_end_lng, :decimal
  end
end
