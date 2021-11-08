class Bike < ApplicationRecord
  attachment :image

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :users, dependent: :destroy

  belongs_to :company
  belongs_to :cc

  def Bike.search(search, bike_or_user, how_search)
    if bike_or_user == "1"
      if how_search == "1"
        Bike.where(['name LIKE ?', "%#{search}%"])
      elsif how_search == "2"
        Bike.where(['name LIKE ?', "#{search}"])
      elsif how_search == "3"
        Bike.where(['name LIKE ?', "#{search}%"])
      elsif how_search == "4"
        Bike.where(['name LIKE ?', "%#{search}"])
      else
        Bike.all
      end
    end
  end

  def avg_score
    if posts.empty?
      0.0
    else
      posts.average(:rate).round(1)
    end
  end

  def avg_score_percentage
    if posts.empty?
      0.0
    else
      posts.average(:rate).round(1).to_f * 100 / 5
    end
  end

end
