class Stations

	def initialize(zip = nil, station = nil)
		@response ||= get_nearest_stations_response(zip) if zip
	end

	def self.get_nearest_stations(zip)
		new(zip)
	end

	def get_nearest_stations_response(zip)
		NrelService.get_nearest_stations(zip)
	end

	def fuel_stations
		@response[:fuel_stations].map do |station| 
			Stations.new(nil, station)
	end

end