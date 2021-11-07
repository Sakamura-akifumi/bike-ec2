class Bike < ApplicationRecord
  attachment :image

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy

  belongs_to :company
  belongs_to :cc
end
