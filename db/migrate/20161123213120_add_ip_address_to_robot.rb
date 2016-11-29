class AddIpAddressToRobot < ActiveRecord::Migration
  def change
  	add_column :robots, :ip_address, :string
  end
end
