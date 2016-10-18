class AddRunningToRobot < ActiveRecord::Migration
  def change
  	add_column :robots, :is_running, :boolean, :default => false
  end
end
