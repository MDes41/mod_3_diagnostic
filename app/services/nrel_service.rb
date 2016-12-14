class NrelService

	def initialize
		@conn = Faraday.new("https://developer.nrel.gov")
	end

	def self.get_nearest_stations(zip)
		JSON.parse(new.get_nearest_stations_response(zip).body, sybolize_names: true)
	end

	def get_nearest_stations_response
		
	end