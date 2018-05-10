require "rails_helper"

RSpec.feature "logging in" do
  scenario "user can't login in with incorrect password" do
    user = create :user

    visit login_path
    fill_in "session_email", with: user.email
    fill_in "session_password", with: "nuh uh"
    click_on "Log in"

    expect(page).to have_css "h1", text: ("Log in")
  end
end
