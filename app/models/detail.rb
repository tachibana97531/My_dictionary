class Detail < ApplicationRecord
  belongs_to:dictionary
  has_many:keys,dependent: :destroy

  validates :word,presence:true
  validates :explanation,presence:true
end
