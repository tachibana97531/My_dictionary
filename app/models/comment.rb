class Comment < ApplicationRecord
  belongs_to:user
  belongs_to:dictionary
  
  validates :comment_contents,presence:true
end
