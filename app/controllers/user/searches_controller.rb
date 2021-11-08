class User::SearchesController < ApplicationController

  def search
    @bike_or_user = params[:option]
    @how_search = params[:choice]
    @search = params[:search]

    if @bike_or_user == "1"
      @bikes = Bike.search(params[:search], @bike_or_user, @how_search)
    else
      @users = User.search(params[:search], @bike_or_user, @how_search)
    end
  end

end
