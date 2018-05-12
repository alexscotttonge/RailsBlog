require "rails_helper"

RSpec.feature "logging in" do
  scenario "user can't login in with incorrect password" do
    user = create :user

    visit login_path
    fill_in "session_email", with: user.email
    fill_in "session_password", with: "nuh uh"
    click_button "Log in"

    expect(page).to have_css "h1", text: ("Log in")
  end

  scenario "user can login with correct details" do
    user = create :user

    visit login_path
    fill_in "session_email", with: user.email
    fill_in "session_password", with: user.password
    click_button "Log in"

    expect(page).to have_css "h1", text: (user.name)
  end
end
