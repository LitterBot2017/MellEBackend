Rails.application.routes.draw do

  post "api/boundary" => "api#set_boundary"
  get "api/boundary" => "api#get_boundary"

  post "api/running" => "api#set_running"
  get "api/running" => "api#get_running"

  post "api/heartbeat" => "api#set_heartbeat"
  get "api/heartbeat" => "api#get_heartbeat"

end
