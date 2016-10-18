class AddRobotIdToBoundary < ActiveRecord::Migration
  def change
  	add_column :boundaries, :robot_id, :integer
  end
end
