require "rails_helper"

RSpec.feature "signing in" do
  scenario "signing in to the blog" do
    visit root_path
    click_on "Sign up to the blog"

    fill_in "user_name", with: "The dude"
    fill_in "user_email", with: "duder@abiding.org"
    fill_in "user_password", with: "10pin"
    fill_in "user_password_confirmation", with: "10pin"
    click_on "Create my account"

    expect(page).to have_content "The dude"
  end
end
