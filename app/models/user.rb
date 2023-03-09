class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many:dictionaries,dependent: :destroy
  has_many:favorites,dependent: :destroy
  has_many:comments,dependent: :destroy

  validates :last_name,presence:true
  validates :first_name,presence:true
  validates :last_name_kana,presence:true
  validates :first_name_kana,presence:true
  validates :email,presence:true
  validates :telephone_number,presence:true
  validates :postal_code,presence:true
  validates :address,presence:true
  validates :encrypted_password,presence:true

  def favorites
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: @user.id).pluck(:dictionary_id)
    @favorite_dictionaries = Dictionary.find(favorites)
  end


  def active_for_authentication?
    super && (is_deleted == false)
  end

  def self.guest
   find_or_create_by!(email: 'guest@example.com') do |user|
     user.password = SecureRandom.urlsafe_base64
   end
  end
end
