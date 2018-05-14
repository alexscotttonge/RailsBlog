class HomePageController < ApplicationController

  def home
    if logged_in?
      @post = current_user.posts.build
      @blog_posts = current_user.blog_posts
    end
  end
end
