class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many:dictionaries,dependent: :destroy
  has_many:favorites,dependent: :destroy
  has_many:comments,dependent: :destroy
  
  def active_for_authentication?
    super && (is_deleted == false)
  end
  
  def self.guest
   find_or_create_by!(email: 'guest@example.com') do |user|
     user.password = SecureRandom.urlsafe_base64
   end
  end
end
