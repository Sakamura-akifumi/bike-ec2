class Post < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :bike, optional: true

  attachment :image

end
