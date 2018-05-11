require "rails_helper"

RSpec.feature "signing in" do
  scenario "user can sign in to the blog" do
    visit signup_path

    fill_in "user_name", with: "The dude"
    fill_in "user_email", with: "duder@abiding.org"
    fill_in "user_password", with: "10pin"
    fill_in "user_password_confirmation", with: "10pin"
    click_on "Create my account"

    expect(page).to have_content "The dude"
  end

  scenario "user can't sign in with invalid details" do
    visit signup_path

    fill_in "user_name", with: "The dude"
    fill_in "user_email", with: "duder@abiding.org"
    fill_in "user_password", with: ""
    fill_in "user_password_confirmation", with: ""
    click_on "Create my account"

    expect(page).to have_title "Sign up"
  end
end
