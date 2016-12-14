class Stations
	attr_reader :distance, :station_name, :street_address, :access_days_time, :fuel_type_code

	def initialize(station)
		@distance = station[:distance]
		@station_name = station[:station_name]
		@street_address = station[:street_address]
		@access_days_time = station[:access_days_time]
		@fuel_type_code = station[:fuel_type_code]
	end

	def self.get_nearest_stations(zip)
		NrelService.get_nearest_stations(zip)[:fuel_stations].map do |station|
			Stations.new(station)
		end
	end

end