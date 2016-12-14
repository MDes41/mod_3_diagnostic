class Stations
	attr_reader :distance, :station_name, :street_address, :access_days_time, :fuel_type_code

	def initialize(station)
		@distance = format_distance(station)
		@station_name = station[:station_name]
		@street_address = address(station)
		@access_days_time = station[:access_days_time]
		@fuel_type_code = fuel_type(station)
	end

	def self.get_nearest_stations(zip)
		NrelService.get_nearest_stations(zip)[:fuel_stations].map do |station|
			Stations.new(station)
		end
	end

	def address(station)
		"#{station[:street_address]} #{station[:city]}, #{station[:state]} #{station[:zip]}"
	end

	def fuel_type(station)
		fuel_types = { 'ELEC' => 'Electric', 'LPG' => 'Liquefied Petroleum Gas (Propane)'  }
		fuel_types[station[:fuel_type_code]]
	end

	def format_distance(station)
		"#{station[:distance]} Miles"
	end
end