class Post < ApplicationRecord

  belongs_to :user, optional: true
  belongs_to :bike_params, optional: true

  attachment :image

end
