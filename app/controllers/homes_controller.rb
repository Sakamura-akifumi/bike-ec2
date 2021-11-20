class HomesController < ApplicationController

  def top
    # メーカー名から絞る
    @companies = Company.all
    # 排気量から絞る
    @ccs = Cc.all
    # ランキング機能
    @bikes = Bike.
      find(Post.
                    limit(4).
                    group(:rate).
                    order(Arel.sql('avg(rate) desc')).
                    pluck(:bike_id))
    @ccs = Cc.all
  end

end
