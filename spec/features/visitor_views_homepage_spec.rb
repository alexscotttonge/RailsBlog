require "rails_helper"

RSpec.feature "viewing homepage" do
  scenario "to sign up to the blog" do
    visit root_path

    expect(page).to have_title "Blog"

    visit login_path

    expect(page).to have_title "Log in"
  end
end
