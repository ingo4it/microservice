class Api::V1::FlightsController < ApplicationController
  
  def paths
    post_data = request.body.read    
    paths = JSON.parse(post_data)
    airports_paths_obj = Flight::get_starting_ending(paths)    
    json_response(airports_paths_obj.to_json)    
  end

end
