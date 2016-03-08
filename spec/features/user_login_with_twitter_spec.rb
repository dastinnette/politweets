require 'rails_helper'

RSpec.feature "user logs in" do

  scenario "with twitter" do
    visit root_path
    expect(page.status_code).to eq(200)

    VCR.use_cassette "user_logs_in" do
      click_on "Login with Twitter"
    end

    expect(current_path).to eq(tweets_path)
    expect(page).to have_content("#feelthebern")
    expect(page).to have_content("makeamericagreatagain")
    expect(page).to have_link("logout")
  end

end
