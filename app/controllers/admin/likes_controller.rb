class Admin::LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @bike = Bike.find(params[:bike_id])
    like = current_user.likes.new(bike_id: @bike.id)
    like.save
  end

  def destroy
    @bike = Bike.find(params[:bike_id])
    like = current_user.likes.find_by(bike_id: @bike.id)
    like.destroy
  end

  private

  def set_book
    @bike = Bike.find(params[:bike_id])
  end

end
