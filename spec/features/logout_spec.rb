require "rails_helper"

RSpec.feature "logging out" do
  scenario "user can log out" do
    user = create :user

    visit login_path
    fill_in "session_email", with: user.email
    fill_in "session_password", with: user.password
    click_button "Log in"

    within "header" do
      click_on "Log out"
    end

    expect(page).to have_css "h1", text: ("Log in")
  end
end
