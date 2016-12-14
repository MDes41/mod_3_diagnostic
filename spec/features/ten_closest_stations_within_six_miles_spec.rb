require 'rails_helper'

describe 'Closest Stations' do
	context 'gets the ten closest stations' do
		it 'within 10 miles' do
			VCR.use_cassette('feature_search_closets_stations') do
				visit '/'
				fill_in 'q', with: "80203"
				click_on 'Locate'
				expect(current_path).to eq('/search')
				expect(find('ul.text')).to have_selector('li', count: 10)
				expect(page).to have_content('Name')
				expect(page).to have_content('Address')
				expect(page).to have_content('Fuel Types')
				expect(page).to have_content('Distance')
				expect(page).to have_content('Access Times')
			end
		end
	end
end