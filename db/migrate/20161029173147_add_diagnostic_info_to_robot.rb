class AddDiagnosticInfoToRobot < ActiveRecord::Migration
  def change
  	add_column :robots, :battery_level, :integer
  	add_column :robots, :signal_strength, :integer
  	add_column :robots, :bin_fullness, :integer
  end
end
