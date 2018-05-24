class PublishesController < ApplicationController

  def create
    post_id = params.fetch(:post_id)
    Post.find(post_id).update(published: true)
    # prefer? Post.find(params[:post_id]).update(published: true)
    redirect_to root_path
  end

end
