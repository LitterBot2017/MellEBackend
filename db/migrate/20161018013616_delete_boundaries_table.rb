class DeleteBoundariesTable < ActiveRecord::Migration
  def change
  	drop_table :boundaries
  end
end
