class PublishesController < ApplicationController

  def create
    Post.find(params[:post_id]).update(published: true)
    redirect_to root_path
  end

end
