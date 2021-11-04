class Ranking < ApplicationRecord

  has_many :bikes, dependent: :destroy
  has_many :posts, dependent: :destroy

end
