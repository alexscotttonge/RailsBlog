class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def new
    @user = User.new
  end

  def create
   @user = User.new(user_params)
   if @user.save
     flash[:success] = "Welcome to the blog"
     redirect_to @user
   else
     render 'new'
   end
 end

 private

    def user_params
       params.require(:user).permit(:name, :email, :password,
                                    :password_confirmation)
    end

    def logged_in_user
      unless logged_in?
          flash[:danger] = "Please log in."
          redirect_to login_url
      end
    end
end
