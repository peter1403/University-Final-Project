class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  def home
    @contents = Content.all.order("created_at DESC")
    .page(params[:page]).per(4)
  end

  def index
    @users = User.page(params[:page]).per(4)
  end

  def new
    @user = User.new
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.page(params[:page]).per(4)
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.page(params[:page]).per(4)
    render 'show_follow'
  end

  def show
    @user = User.find(params[:id])
    if @user.contents.any?
      @contents = @user.contents.all.limit(4)
    else
      @contents = nil
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # Handle a successful save.
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      redirect_to @user
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to index_url
  end

  #Before filters

  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to signup_url
    end
  end

  # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

  # Confirms the correct user.
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  private

    def user_params
      params.require(:user).permit(:username, :description, :password,
                                   :password_confirmation,
                                 :profile_picture)
    end

end
