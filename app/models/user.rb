class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  
  has_many :post_contents, dependent: :destroy 
  has_many :post_comments, dependent: :destroy
  has_many :group_users, dependent: :destroy
  has_many :groups, dependent: :destroy
  has_many :groups, through: :group_users
  has_many :owner_id
  
  
  validates :email, presence: true
  validates :name, presence: true
  validates :encrypted_password, presence: true
  
  def self.looks(search, word)
    if search == "partial_match"
      @user = User.where("name LIKE?","%#{word}%")
    else
      @user = User.all
    end
  end
  
  GUEST_USER_EMAIL = "guest@example.com"

  def guest?
    email == "guest@example.com"
  end


  def self.guest
    # find_or_create_byでメールアドレスが存在するかどうか判断。存在しない場合はデータを作成する。
    find_or_create_by(email: GUEST_USER_EMAIL) do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guestuser"
    end
  end
  
end
