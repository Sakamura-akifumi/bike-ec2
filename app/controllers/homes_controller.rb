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

  def guest_sign_in
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
      user.name = 'ゲスト'
      user.name_id = 'guest'
    end
    sign_in user
    redirect_to user_user_path(user), notice: 'ゲストユーザーとしてログインしました。'
  end

end
