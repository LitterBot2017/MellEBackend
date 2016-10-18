class AddActiveToBoundary < ActiveRecord::Migration
  def change
  	add_column :boundaries, :active, :boolean, :default => true
  end
end
