class Tag < ApplicationRecord
  has_many:tag_posts,dependent: :destroy,foreign_key:'tag_id'
  has_many:dictionaries,through: :tag_posts,dependent: :destroy

  validates:tag_name,uniqueness:true,presence:true
end
