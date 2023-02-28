class TagPost < ApplicationRecord
  belongs_to:dictionary
  belongs_to:tag

  validates:dictionary_id,presence:true
  validates:tag_id,presence:true
end
