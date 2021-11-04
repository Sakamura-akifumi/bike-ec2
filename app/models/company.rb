class Company < ApplicationRecord

  has_many :bikes, dependent: :destroy

end
