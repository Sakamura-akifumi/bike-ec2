class User::PostsController < ApplicationController
  before_action :set_post, only: [:destroy, :edit, :update]

  def index
    @posts = Post.all.order(created_at: :desc).page(params[:page]).per(6)
  end

  def show
  end

  def edit
    @post = Post.find(params[:id])
    @post.user_id = current_user.id
    @post.bike_id = params[:bike_id]
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to user_bike_path(@post.bike_id), notice: 'You have updated user successfully'
    else
      render :edit
    end
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.bike_id = params[:bike_id]
    @post.score = Language.get_data(post_params[:content])
    if @post.save!
      redirect_to user_bike_path(@post.bike_id)
    else
      flash.now[:warning] = "入力不備があります"
      render :new
    end
  end

  def new
    @post = Post.new
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to user_bike_path(@post.bike_id)
    end
  end

  def post_params
    params.require(:post).permit(:title, :content, :bike_id, :rate)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
