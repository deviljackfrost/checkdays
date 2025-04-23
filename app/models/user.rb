class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  
  has_one_attached :profile_image       
  has_many :post_contents, dependent: :destroy 
  has_many :post_comments, dependent: :destroy
  
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
end
