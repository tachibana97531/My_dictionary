class Detail < ApplicationRecord
  belongs_to:dictionary
  has_many:keys,dependent: :destroy
end
