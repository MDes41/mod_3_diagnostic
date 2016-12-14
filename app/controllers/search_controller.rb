class SearchController < ApplicationController
	def index
		@stations = Stations.get_nearest_stations(params[:q])
		response = Faraday.get("https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=&location=#{params[:q]}&radius=6&fuel_type=ELEC,LPG&limit=10&access=all")
		json_parsed = JSON.parse(response.body, sybolize_names: true)
		byebug
	end
end