class PostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :edit]
  before_action :correct_user,   only: [:destroy, :edit]

  def index
    @posts = Post.all
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Blog post created!"
      redirect_to root_url
    else
      render 'home_page/home'
    end
  end

  def edit
    render locals: { post: current_post }
  end

  def show
    render locals: { post: current_post }
  end

  def update
    if current_post.update(post_params)
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def destroy
    current_post.destroy
    flash[:success] = "Blog post deleted"
    redirect_to root_url
  end

  private

    def post_params
      params.require(:post).permit(:title, :content)
    end

    def correct_user
      redirect_to root_url if current_post.nil?
    end

    def current_post
      current_user.posts.find_by(id: params[:id])
    end
end
