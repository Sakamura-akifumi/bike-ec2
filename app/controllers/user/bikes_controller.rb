class User::BikesController < ApplicationController

  def index
    if params[:company_id].present? # メーカーで絞った時
      @bikes = Bike.where(company_id: params[:company_id]).page(params[:page]).per(8)
    elsif params[:cc_id].present? # cc数で絞った時
      @bikes = Bike.where(cc_id: params[:cc_id]).page(params[:page]).per(8)
    else # それ以外の処理（ヘッダーからランキングページに遷移した時）
      @bikes = Bike.all.page(params[:page]).per(8)
    end
    # メーカー名で絞るボタン
    @companies = Company.all
    # CC数で絞るボタン
    @ccs = Cc.all
  end

  def show
    @bike = Bike.find(params[:id])
    @post = Post.new
    @posts = Post.all
    @like = Like.new
  end

  private

  def bike_params
    params.require(:bike).permit(:name, :image, :company_id, :cc_id)
  end

end
