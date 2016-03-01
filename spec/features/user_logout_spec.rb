require 'rails_helper'

RSpec.feature "user logs out", vcr: true do

  it "logged in user can log out to see root path" do
    visit root_path
    click_link "Login with Twitter"

    expect(current_path).to eq(tweets_path)
    expect(page).to have_content("David")
    expect(page).to have_link("Logout")

    click_link "Logout"
    expect(current_path).to eq(root_path)
    expect(page).to have_content("Welcome to PoliTweets")
  end

end
