# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Robot.create(
	:boundary_start_lat => 40.4440829681405,
    :boundary_start_lng => -79.943168275,
    :boundary_end_lat => 40.4429870540925,
    :boundary_end_lng => -79.942529238,
    :is_running => false,
    :latitude => 40.443505,
    :longitude => -79.942933,
    :battery_level => 100,
    :signal_strength => 100,
    :bin_fullness => 0)