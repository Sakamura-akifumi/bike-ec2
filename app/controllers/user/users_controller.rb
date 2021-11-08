class User::UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy, :followings, :followers, :edit, :update]

  def index
    @users = User.all
  end

  def show
    @posts = Post.includes(:user, :bike).where(user_id: @user.id).order(created_at: :desc).page(params[:page]).per(6)
    likes = Like.where(user_id: @user.id).pluck(:bike_id) #
    @like_list = Bike.find(likes)
  end

  def edit
    if @user == current_user
      render "edit"
    else
      redirect_to user_user_path(@user.id)
    end
  end

  def update
    if @user.update(user_params)
      redirect_to user_user_path(@user.id), notice: 'You have updated user successfully'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image, :email)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
