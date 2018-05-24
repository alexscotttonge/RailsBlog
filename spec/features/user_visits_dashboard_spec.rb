require "rails_helper"
include ManagingUserHelper

RSpec.feature "visiting the dashboard" do
  context "when the user is logged in" do
    scenario "when the user is on the homepage" do
      log_user_in

      visit root_path

      expect(page).to have_css "h1", text: ("All blog posts")

      within "header" do
        click_on "Visit dashboard"
      end

      expect(page).to have_css "h1", text: "The dude"
    end
  end
end
