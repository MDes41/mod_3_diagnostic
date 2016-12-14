require 'rails_helper'

describe 'Closest Stations' do
	context 'gets the ten closest stations' do
		xit 'within 10 miles' do
			visit '/'
			fill_in 'q', with: "80203"
			click_on 'Locate'
			expect(current_path).to eq('/search')
			expect(find('ul.text')).to have_selector('li', count: 10)
			expect(page).to have_content('Name')
			expect(page).to have_content('Fuel Types')
			expect(page).to have_content('Distance')
			expect(page).to have_content('Access Times')
			# As a user
			# When I visit "/"
			# And I fill in the search form with 80203
			# And I click "Locate"
			# Then I should be on page "/search" with parameters visible in the url
			# Then I should see a list of the 10 closest stations within 6 miles sorted by distance
			# And the stations should be limited to Electric and Propane
			# And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
		end
	end
end