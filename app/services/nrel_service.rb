class NrelService

	def initialize
		@conn = Faraday.new("https://developer.nrel.gov")
	end

	def self.get_nearest_stations(zip)
		JSON.parse(new.get_nearest_stations_response(zip).body, symbolize_names: true)
	end

	def get_nearest_stations_response(zip)
		conn.get do |req|
		  req.url '/api/alt-fuel-stations/v1/nearest.json'
		  req.params = { api_key: ENV['NREL_API_KEY'], location: zip, radius: 6, fuel_type: 'ELEC,LPG', limit: 10, access: 'all'}
		end
	end

	private
		attr_reader :conn
end