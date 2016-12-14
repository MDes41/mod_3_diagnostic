require 'rails_helper'

describe 'Stations Model' do
	context 'get nearest stations' do
		it 'returns closest stations' do
			VCR.use_cassette('stations_get_nearest_station') do
				zip = 80203
				stations = Stations.get_nearest_stations(zip)

				expect(stations.first).to respond_to(:distance)
				expect(stations.first).to respond_to(:station_name)
				expect(stations.first).to respond_to(:street_address)
				expect(stations.first).to respond_to(:access_days_time)
				expect(stations.first).to respond_to(:fuel_type_code)
			end
		end
	end

	context 'Stations initialize' do
		it 'correctly getst the attributes' do 

			response = "{
									\"access_days_time\": \"24 hours daily\",
									\"cards_accepted\": \"null\",
									\"date_last_confirmed\": \"2016-12-14\",
									\"expected_date\": \"null\",
									\"fuel_type_code\": \"ELEC\",
									\"id\": 66897,
									\"groups_with_access_code\": \"Public\",
									\"open_date\": \"null\",
									\"owner_type_code\": \"null\",
									\"status_code\": \"E\",
									\"station_name\": \"UDR\",
									\"station_phone\": \"888-758-4389\",
									\"updated_at\": \"2016-12-14T09:26:44Z\",
									\"geocode_status\": \"GPS\",
									\"latitude\": \"39.7300224\",
									\"longitude\": \"-104.9883424\",
									\"city\": \"Denver\",
									\"intersection_directions\": \"816 ACOMA 1; For residents only - 5th Floor\",
									\"plus4\": \"null\",
									\"state\": \"CO\",
									\"street_address\": \"800 Acoma St\",
									\"zip\": \"80204\",
									\"bd_blends\": \"null\",
									\"e85_blender_pump\": \"null\",
									\"ev_connector_types\": [
										\"J1772\"
									],
									\"ev_dc_fast_num\": \"null\",
									\"ev_level1_evse_num\": \"null\",
									\"ev_level2_evse_num\": 2,
									\"ev_network\": \"ChargePoint Network\",
									\"ev_network_web\": \"http://www.chargepoint.com/\",
									\"ev_other_evse\": \"null\",
									\"hy_status_link\": \"null\",
									\"lpg_primary\": \"null\",
									\"ng_fill_type_code\": \"null\",
									\"ng_psi\": \"null\",
									\"ng_vehicle_class\": \"null\",
									\"ev_network_ids\": {
										\"posts\": [
											\"1:118249\"
										]
										},
									\"distance\": \"0.3117\"
								}"
				
			station = Stations.new(JSON.parse(response, symbolize_names: true))

			expect(station.distance).to eq('0.3117 Miles')
			expect(station.station_name).to eq('UDR')
			expect(station.street_address).to eq("800 Acoma St Denver, CO 80204")
			expect(station.access_days_time).to eq("24 hours daily")
			expect(station.fuel_type_code).to eq("Electric")
		end
	end 
end