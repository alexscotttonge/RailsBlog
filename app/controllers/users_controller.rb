class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update]

  def index
    render locals: { users: User.all }
  end

  def show
    user = User.find(params[:id])
    render locals: { user: user,
                     posts: user.posts
                   }
  end

  def new
    render locals: { user: User.new }
  end

  def create
    user = User.new(user_params)
    if user.save
      flash[:success] = "Welcome to the blog"
      log_in user
      redirect_to new_post_path
    else
      render :new, locals: { user: user }
    end
 end

 private

    def user_params
       params.require(:user).permit(:name, :email, :password,
                                    :password_confirmation)
    end
end
