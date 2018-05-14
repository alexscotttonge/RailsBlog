require "rails_helper"

RSpec.feature "creating a blogpost" do
  scenario "when the user is logged in" do
    user = create :user
    visit login_path

    fill_in "session_email", with: user.email
    fill_in "session_password", with: user.password
    click_button "Log in"

    fill_in "post_title", with: "xColor rocks"
    fill_in "post_content", with: "Here are some reasons"
    click_on "Post"

    expect(page).to have_content ("xColor rocks")
  end
end
