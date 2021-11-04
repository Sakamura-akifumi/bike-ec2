class Admin::BikesController < ApplicationController
  before_action :authenticate_admin!, only: [:create, :edit, :update, :index, :show, :new]


  def new
    @bike = Bike.new
  end

  def index
    if params[:region_id].present? # メーカーで絞った時
      @bike = Bike.where(company_id: params[:company_id]).page(params[:page]).per(8)
    elsif params[:cc_id].present? # cc数で絞った時
      @bike = Bike.where(cc_id: params[:cc_id]).page(params[:page]).per(8)
    else # それ以外の処理（ヘッダーからランキングページに遷移した時）
      @bike = Bike.all.page(params[:page]).per(8)
    end

    @companies = Company.all
  end

  def show
    @bike = Bike.find(params[:id])
  end

  def edit
    @bike = Bike.find(params[:id])
  end

  def update
    @bike = Bike.find(params[:id])
    if @bike.update(bike_params)
      redirect_to admin_bike_path, notice: 'You have updated user successfully'
    else
      flash.now[:warning] = "入力不備があります"
      render :edit
    end
  end

  def create
    @bike = Bike.new(bike_params)
    if @bike.save!
      redirect_to admin_bike_path(@bike)
    else
      flash.now[:warning] = "入力不備があります"
      render :new
    end
  end

  def destroy
    @bike = Bike.find(params[:id])
    if @bike.destroy
      redirect_to admin_bike_path
    end
  end

  private

  def bike_params
    params.require(:bike).permit(:name, :image, :company_id, :cc_id)
  end

end
