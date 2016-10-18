Rails.application.routes.draw do

  post "api/setBoundary" => "api#set_boundary", :as => "api_set_boundary"
  get "api/getBoundary" => "api#get_boundary"

end
