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

      expect(page).to have_content "xColor rocks"

      # clicking on the title renders the view for all blogs
      within "span.title" do
        click_on "xColor rocks"
      end

      expect(page).to have_css "h1", text: "xColor rocks"
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

      expect(page).to have_title "Dashboard"
      expect(page).to have_content "Blog post deleted"
    end

    it "user can edit a post" do
      user = create :user
      visit login_path

      fill_in "session_email", with: user.email
      fill_in "session_password", with: user.password
      click_button "Log in"

      fill_in "post_title", with: "xColor rocks"
      fill_in "post_content", with: "Here are some reasons"
      click_on "Post"
      click_on "edit"

      fill_in "post_content", with: "Here are 5 reasons"
      click_on "Save changes"

      expect(page).to have_content "Here are 5 reasons"
    end
  end
end
