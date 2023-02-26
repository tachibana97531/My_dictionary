class TagPost < ApplicationRecord
  belongs_to:dictionary
  belongs_to:tag
end
