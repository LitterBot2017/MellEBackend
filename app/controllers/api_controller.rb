class ApiController < ApplicationController

	skip_before_filter  :verify_authenticity_token

	# curl -X POST -H "Content-Type: application/json" 
	# -d '{"robotID":1, "startLat":40.444585, "startLng": -79.942905, "endLat": 40.441273, "endLng": -79.943371}'
	# localhost:3000/api/boundary
	# https://obscure-spire-79030.herokuapp.com/api/boundary
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
	# curl -X GET https://obscure-spire-79030.herokuapp.com/api/boundary?robotID=1
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
	# curl -X POST -H "Content-Type: application/json" -d '{"robotID":1, "isRunning":true}' https://obscure-spire-79030.herokuapp.com/api/running
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
	# curl -X GET https://obscure-spire-79030.herokuapp.com/api/running?robotID=1
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
	# -d '{"robotID":1, "lat": 40.443505, "lng": -79.942933, "batteryLevel": 100, "signalStrength": 100, "binFullness": 0 }'
	# localhost:3000/api/heartbeat
	# https://obscure-spire-79030.herokuapp.com/api/heartbeat
	# Params: robotID, lat, lng, batteryLevel, signalStrength, binFullness
	def set_heartbeat

		puts request.raw_post
		params = JSON.parse(request.raw_post)

		robot = Robot.find_by(:id => params[:robotID])

		if robot

			location = Location.create(
				:latitude => params[:lat],
				:longitude => params[:lng],
				:robot_id => robot.id)

			robot.update!(
				:battery_level => params[:batteryLevel],
				:signal_strength => params[:signalStrength],
				:bin_fullness => params[:binFullness],
				:current_location_id => location.id)

			render :nothing => true, :status => 200 and return
		else
			render :nothing => true, :status => 400 and return
		end

	end

	# curl -X GET localhost:3000/api/heartbeat?robotID=1
	# curl -X GET https://obscure-spire-79030.herokuapp.com/api/heartbeat?robotID=1
	# Params: robotID, withPath
	def get_heartbeat

		@robot = Robot.find_by(:id => params[:robotID])
		@with_path = params[:withPath]
		if @robot
			
			render :file => "api/get_heartbeat.json.erb",
				:content_type => 'application/json',
				:status => 200 and return
		else
			render :nothing => true, :status => 400 and return
		end
	end

	# curl -X POST -H "Content-Type: application/json" 
	# -d '{"robotID":1, "ipAddress": "192.168.0.1:8000" }'
	# localhost:3000/api/ipAddress
	# https://obscure-spire-79030.herokuapp.com/api/ipAddress
	# Params: robotID, ipAddress
	def set_ip_address

		robot = Robot.find_by(:id => params[:robotID])

		if robot

			robot.update!(
				:ip_address => params[:ipAddress])

			render :nothing => true, :status => 200 and return
		else
			render :nothing => true, :status => 400 and return
		end

	end

	# curl -X GET localhost:3000/api/ipAddress?robotID=1
	# curl -X GET https://obscure-spire-79030.herokuapp.com/api/ipAddress?robotID=1
	# Params: robotID
	def get_ip_address

		@robot = Robot.find_by(:id => params[:robotID])
		if @robot
			
			render :file => "api/get_ip_address.json.erb",
				:content_type => 'application/json',
				:status => 200 and return
		else
			render :nothing => true, :status => 400 and return
		end
	end
end
