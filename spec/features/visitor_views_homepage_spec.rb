require "rails_helper"

RSpec.feature "viewing homepage" do
  scenario "to sign up to the blog" do
    visit root_path

    expect(page).to have_title "Blog"

    visit signup_path

    expect(page).to have_title "Sign up"
  end
end
