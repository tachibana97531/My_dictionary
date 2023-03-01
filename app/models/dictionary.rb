class Dictionary < ApplicationRecord
  has_one_attached:image
  belongs_to:user
  has_many:goods,dependent: :destroy
  has_many:comments,dependent: :destroy
  has_many:tag_posts,dependent: :destroy
  has_many:tags,through: :tag_posts,dependent: :destroy
  has_many:details,dependent: :destroy

  enum post_status: {closing:0,opening:1}

  def get_image(width, height)
  unless image.attached?
    file_path = Rails.root.join('app/assets/images/no_image.jpg')
    image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
    image.variant(resize_to_limit: [width, height])
  end

  def save_tag(sent_tags)
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags
    old_tags.each do |old|
      self.tags.delete Tag.find_by(tag_name:old)
    end
    new_tags.each do |new|
      new_dictionary_tag = Tag.find_or_create_by(tag_name:new)
      self.tags << new_dictionary_tag
    end
  end
end
