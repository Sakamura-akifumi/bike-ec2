class Cc < ApplicationRecord

  has_many :bikes, dependent: :destroy

end
