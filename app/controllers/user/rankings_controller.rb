class User::RankingsController < ApplicationController

  def index
    if params[:company_id].present? # メーカーで絞った時
      @bike = Bike.where(company_id: params[:company_id])
    elsif params[:cc_id].present? # 排気量で絞った時
      @bike = Bike.where(cc_id: params[:cc_id])
    else # それ以外の処理（ヘッダーからランキングページに遷移した時）
      @bikes = Bike.all
    end

    # ランキング機能（昇順）
    bikes = @bikes.
      find(Post.where(bike_id: @bikes.ids).
                      group(:bike_id).
                      order('avg(rate) desc').
                      pluck(:bike_id))

    params[:page] ||= 1
    @bikes = Kaminari.paginate_array(bikes).page(params[:page]).per(8)

    # 地方で絞るボタン
    @companies = Company.all
    # 県名で絞るボタン
    @ccs = Cc.all
  end

  def show
  end
end
