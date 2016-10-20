class ApiController < ApplicationController

	skip_before_filter  :verify_authenticity_token

	# curl -X POST -H "Content-Type: application/json" 
	# -d '{"robotID":1, "startLat":40.444585, "startLng": -79.942905, "endLat": 40.441273, "endLng": -79.943371}'
	# localhost:3000/api/boundary
	# Params: robotID, startLat, startLng, endLat, endLng
	def set_boundary

		robot = Robot.find_by(:id => params[:robotID])

		if robot
			robot.update!(
				:boundary_start_lat => params[:startLat],
				:boundary_start_lng => params[:startLng],
				:boundary_end_lat => params[:endLat],
				:boundary_end_lng => params[:endLng])

			render :nothing => true, :status => 200 and return
		else
			render :nothing => true, :status => 400 and return
		end

	end

	# curl -X GET localhost:3000/api/boundary?robotID=1
	# Params: robotID
	def get_boundary

		@robot = Robot.find_by(:id => params[:robotID])

		if @robot
			
			render :file => "api/get_boundary.json.erb",
				:content_type => 'application/json',
				:status => 200 and return
		else
			render :nothing  => true, :status => 400 and return
		end

	end

	# curl -X POST -H "Content-Type: application/json" -d '{"robotID":1, "isRunning":true}' localhost:3000/api/running
	# Params: robotID, isRunning
	def set_running

		robot = Robot.find_by(:id => params[:robotID])

		if robot
			robot.update!(
				:is_running => params[:isRunning])

			render :nothing => true, :status => 200 and return
		else
			render :nothing => true, :status => 400 and return
		end

	end

	# curl -X GET localhost:3000/api/running?robotID=1
	# Params: robotID
	def get_running

		@robot = Robot.find_by(:id => params[:robotID])

		if @robot
			
			render :file => "api/get_running.json.erb",
				:content_type => 'application/json',
				:status => 200 and return
		else
			render :nothing => true, :status => 400 and return
		end

	end

	# curl -X POST -H "Content-Type: application/json" 
	# -d '{"robotID":1, "lat": 40.443505, "lng": -79.942933}'
	# localhost:3000/api/location
	# Params: robotID, lat, lng
	def set_location

		robot = Robot.find_by(:id => params[:robotID])

		if robot
			robot.update!(
				:latitude => params[:lat],
				:longitude => params[:lng])

			render :nothing => true, :status => 200 and return
		else
			render :nothing => true, :status => 400 and return
		end

	end

	# curl -X GET localhost:3000/api/location?robotID=1
	# Params: robotID
	def get_location

		@robot = Robot.find_by(:id => params[:robotID])

		if @robot
			
			render :file => "api/get_location.json.erb",
				:content_type => 'application/json',
				:status => 200 and return
		else
			render :nothing => true, :status => 400 and return
		end

	end

end
