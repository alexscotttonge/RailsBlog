require "rails_helper"
include ManagingUserHelper

RSpec.feature "adding an image to a blog post" do
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
