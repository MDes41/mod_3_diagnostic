class SearchController < ApplicationController
	def index
		@stations = Stations.get_nearest_stations(params[:q])
	end
end