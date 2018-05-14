require "rails_helper"

RSpec.feature "creating a blogpost" do
  context "when the user is logged in" do
    it "user can create a blog post" do
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

    it "user can delete a post" do
      user = create :user
      visit login_path

      fill_in "session_email", with: user.email
      fill_in "session_password", with: user.password
      click_button "Log in"

      fill_in "post_title", with: "xColor rocks"
      fill_in "post_content", with: "Here are some reasons"
      click_on "Post"
      click_on "delete"

      expect(page).to have_title "Blog"
      expect(page).to have_content "Blog post deleted"
    end
  end
end
