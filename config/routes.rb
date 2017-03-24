Rails.application.routes.draw do

  post "api/boundary" => "api#set_boundary"
  get "api/boundary" => "api#get_boundary"

  post "api/running" => "api#set_running"

  post "api/heartbeat" => "api#set_heartbeat"
  get "api/heartbeat" => "api#get_heartbeat"

  post "api/ipAddress" => "api#set_ip_address"
  get "api/ipAddress" => "api#get_ip_address"
end
