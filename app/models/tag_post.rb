class TagPost < ApplicationRecord
  belongs_to:dictionary
  belongs_to:tag
  
  add_index:tag_posts,[:dictionary_id,:tag_id],unique:true
end
