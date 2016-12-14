class Stations

	def initialize(zip)
		@response = get_nearest_stations_response(zip)
	end

	def self.get_nearest_stations(zip)
		new(zip)
	end

	def get_nearest_stations_response(zip)
		NrelService.get_nearest_stations(zip)
	end

end