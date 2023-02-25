class Dictionary < ApplicationRecord
  has_one_attached:image
  belongs_to:user
  has_many:goods,dependent: :destroy
  has_many:comments,dependent: :destroy
  has_many:tag_posts,dependent: :destroy
  has_many:tags,through: :tag_posts,dependent: :destroy
  has_many:details,dependent: :destroy
  
  def get_image(width,height)
    unless image.attached?
      file_path = Rails.root.join("no_image.jpg")
      image.attach(io:File.open(file_path),file_name:"default-image.jpg",content_type:"image/jpeg")
    end
    image.variant(resize_to_limit:[width,height]).processed
  end
  
end
