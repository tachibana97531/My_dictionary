class Dictionary < ApplicationRecord
  has_one_attached:image
  belongs_to:user
  has_many:goods,dependent: :destroy
  has_many:comments,dependent: :destroy
  has_many:tag_posts,dependent: :destroy
  has_many:details,dependent: :destroy
end
