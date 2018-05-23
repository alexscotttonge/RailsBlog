class PostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :edit]
  before_action :correct_user,   only: [:destroy, :edit]

  def index
    @posts = Post.published.paginate(page: params[:page], per_page: 3)
  end

  def new
    render locals: { post: Post.new }
  end

  def create
    post = current_user.posts.build(post_params)

    if post.save
      redirect_to new_post_path, success: "Blog post created!"
    else
      render :new, locals: { post: post }
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
      flash[:success] = "Blog post published"
      redirect_to new_post_path
    else
      render 'edit'
    end
  end

  def destroy
    current_post.destroy
    flash[:success] = "Blog post deleted"
    redirect_to new_post_path
  end

  private

    def post_params
      params.require(:post).permit(:title, :content, :published, uploads: [] )
    end

    def correct_user
      redirect_to root_url if current_post.nil?
    end

    def current_post
      current_user.posts.find_by(id: params[:id])
    end
end
