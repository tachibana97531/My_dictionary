class Tag < ApplicationRecord
  has_many:tag_posts,dependent: :destroy
  has_many:dictionaries,through: :tag_posts,dependent: :destroy
end
