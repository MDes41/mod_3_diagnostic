require 'rails_helper'

describe 'Nrel Service' do
	context 'returns the correct json' do
		it 'only get ten stations' do
			VCR.use_cassette("nrel_nearest_stations") do
				zip = 80203
				response = NrelService.get_nearest_stations(zip)


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