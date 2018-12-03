require 'rails_helper'


feature "user can find representative by state" do
  scenario "user submits valid state name" do
    # As a user

    # When I visit "/"
    visit '/'

    # And I select "Colorado" from the dropdown
    select "Colorado", from: :state

    # And I click on "Locate Members from the House"
    click_on "Locate Members from the House"

    # Then my path should be "/search" with "state=CO" in the parameters
    expect(current_path).to eq("/search")
    expect(current_url).to include("state=CO")

    # And I should see a message "7 Results"
    expect(page).to have_content("7 Results")


    # And I should see a list of 7 the members of the house for Colorado
    expect(page).to have_css(".member", count: 7)

    # And I should see a name, role, party, and district for each member
    within(first(".member")) do
      expect(page).to have_css(".name")
      expect(page).to have_css(".role")
      expect(page).to have_css(".party")
      expect(page).to have_css(".district")

      # REMEMBER TO UPDATE ME WITH REAL DATA ONCE YOU GET THERE
      expect(page).to have_content("Diana DeGette")
      expect(page).to have_content("Representative")
      expect(page).to have_content("D")
      expect(page).to have_content("1")
    end

    expect(page).to have_content("Copyright (c) 2018 Pro Publica Inc. All Rights Reserved.")

  end
end
