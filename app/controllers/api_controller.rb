class ApiController < ApplicationController

	# Params: robotID, startLat, startLng, endLat, endLng
	def set_boundary

		robot = Robot.find_by(:id => param[:robotID])

		if robot
			robot.update!(
				:boundary_start_lat => param[:startLat],
				:boundary_start_lng => param[:startLng],
				:boundary_end_lat => param[:endLat],
				:boundary_end_lng => param[:endLng])

			render :nothing, :status => 200 and return
		else
			render :nothing, :status => 400 and return
		end

	end

	# Params: robotID
	def get_boundary

		@robot = Robot.find_by(:id => param[:robotID])

		if @robot
			
			render :file => "api/get_boundary.json.erb",
				:content_type => 'application/json',
				:status => 200 and return
		else
			render :nothing, :status => 400 and return
		end

	end

	# Params: robotID, isRunning
	def set_running

		robot = Robot.find_by(:id => param[:robotID])

		if robot
			robot.update!(
				:is_running => param[:isRunning])

			render :nothing, :status => 200 and return
		else
			render :nothing, :status => 400 and return
		end

	end

	# Params: robotID
	def get_running

		@robot = Robot.find_by(:id => param[:robotID])

		if @robot
			
			render :file => "api/get_running.json.erb",
				:content_type => 'application/json',
				:status => 200 and return
		else
			render :nothing, :status => 400 and return
		end

	end

end
