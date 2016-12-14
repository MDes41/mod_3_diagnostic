require 'rails_helper'

describe 'Stations Model' do
	context 'get nearest stations' do
		it 'returns closest stations' do
			VCR.use_cassette('stations_get_nearest_station') do
				zip = 80203
				response = Stations.get_nearest_stations(zip)

				expect(response).to have_key(:fuel_stations)
				expect(response[:fuel_stations].first).to have_key(:distance)
				expect(response[:fuel_stations].first).to have_key(:station_name)
				expect(response[:fuel_stations].first).to have_key(:street_address)
				expect(response[:fuel_stations].first).to have_key(:access_days_time)
				expect(response[:fuel_stations].first).to have_key(:fuel_type_code)
			end
		end
	end
end