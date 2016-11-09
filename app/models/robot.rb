class Robot < ActiveRecord::Base

	has_many :locations
	belongs_to :current_location, :class_name => "Location"

end
