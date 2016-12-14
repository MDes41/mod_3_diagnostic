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
				within('li:first-child') do
					expect(page).to have_content('UDR')
					# expect(page).to have_content('800 Acoma St Denver, CO 80204')
					# expect(page).to have_content('Electric')
					# expect(page).to have_content('24 hourse daily')
					# expect(page).to have_content('0.3117 Miles ')
				end
			end
		end
	end
end