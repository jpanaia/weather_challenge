class MainController < ApplicationController
  def index
	open('http://api.wunderground.com/api/5f882a1b3107cc1e/geolookup/conditions/q/OR/Portland.json') do |f|
	  json_string = f.read
	  parsed_json = JSON.parse(json_string)
	  @city = parsed_json['location']['city']
	  @state = parsed_json['location']['state']
	  @temp_f = parsed_json['current_observation']['temp_f']
	  @icon = parsed_json['current_observation']['icon_url']
	  @forecast_link = parsed_json['current_observation']['forecast_url']
     end
  end
end
