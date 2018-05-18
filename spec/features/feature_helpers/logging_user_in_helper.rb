module ManagingUser
  def log_user_in
    user = create :user
    visit login_path

    fill_in "session_email", with: user.email
    fill_in "session_password", with: user.password
    click_button "Log in"
  end

  def fill_in_and_save_blog_draft
    fill_in "post_title", with: "xColor rocks"
    fill_in "post_content", with: "Here are some reasons"
    click_on "Save as draft"
  end
end
