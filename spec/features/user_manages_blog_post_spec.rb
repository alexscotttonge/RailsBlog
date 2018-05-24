require "rails_helper"
include ManagingUser


RSpec.feature "creating a blog post" do
  context "when the user is logged in" do
    it "user can create a blog post" do
      log_user_in

      fill_in "post_title", with: "xColor rocks"
      fill_in "post_content", with: "Here are some reasons"
      click_on "Save as draft"

      expect(page).to have_content "xColor rocks"

      # clicking on the title renders the view for all blogs
      within "span.title" do
        click_on "xColor rocks"
      end

      expect(page).to have_css "h1", text: "xColor rocks"
    end

    it "user can delete a post" do
      log_user_in

      fill_in_and_save_blog_draft
      click_on "delete"

      expect(page).to have_title "Dashboard"
      expect(page).to have_content "Blog post deleted"
    end
  end
end

RSpec.feature "user creates a post" do
  context "when it is saved as a draft" do
    it "the homepage doesn't render draft posts" do
      log_user_in

      fill_in_and_save_blog_draft

      visit root_path

      expect(page).not_to have_content "xColor rocks"
    end
  end

  context "when it is published" do
    it "the homepage displays the post" do
      log_user_in

      fill_in_and_save_blog_draft
      click_on "publish"

      expect(page).to have_content "xColor rocks"
    end
  end

  context "when there is an attachment" do
    it "the attachment is available on the posts#show view" do
      log_user_in

      fill_in "post_title", with: "xColor rocks"
      fill_in "post_content", with: "Here are some reasons"
      page.attach_file("post_uploads", Rails.root + "spec/support/rails.png")

      click_on "Save as draft"

      within "span.title" do
        click_on "xColor rocks"
      end

      expect(page).to have_css "h5", text: "Uploads:"
    end
  end
end

RSpec.feature "editing a post" do
  scenario "editing a post from the show page" do
    log_user_in

    fill_in_and_save_blog_draft

    click_on "publish"

    visit new_post_path

    click_on "xColor rocks"
    click_on "edit"

    fill_in "post_content", with: "Here are 5 reasons"
    click_on "Save changes"

    expect(page).to have_content "Here are 5 reasons"
  end

  scenario "when there are no attachments" do
    log_user_in

    fill_in_and_save_blog_draft
    click_on "edit"

    fill_in "post_content", with: "Here are 5 reasons"
    click_on "Save changes"

    expect(page).to have_content "Here are 5 reasons"
  end
end
