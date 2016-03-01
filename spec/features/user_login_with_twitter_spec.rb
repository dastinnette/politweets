require 'rails_helper'

RSpec.feature "user logs in", vcr: true do

  scenario "with twitter" do
    visit root_path
    expect(page.status_code).to eq(200)

    click_on "Login with Twitter"
    expect(current_path).to eq(tweets_path)
    expect(page).to have_content("David")
    expect(page).to have_link("logout")
  end

end
