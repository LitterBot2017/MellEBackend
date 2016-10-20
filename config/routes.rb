Rails.application.routes.draw do

  post "api/boundary" => "api#set_boundary"
  get "api/boundary" => "api#get_boundary"

  post "api/running" => "api#set_running"
  get "api/running" => "api#get_running"


  post "api/location" => "api#set_location"
  get "api/location" => "api#get_location"

end
