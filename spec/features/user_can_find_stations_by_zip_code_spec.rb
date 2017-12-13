require 'rails_helper'

describe 'User visits the root page' do
  it 'they can type in a zip code and see the closest stations within 6 miles' do
    visit root_path

    within("input#q.form-control") do
      fill_in 'input', with: "80203"
    end

    click_on "Locate"

    expect(current_path).to eq("/search?=80203")
    expect(page).to have_content("things")
  end
end

# As a user
# When I visit "/"
# And I fill in the search form with 80203
# And I click "Locate"
# Then I should be on page "/search" with parameters visible in the url
# Then I should see a list of the 10 closest stations within 6 miles sorted by distance
# And the stations should be limited to Electric and Propane
# And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times