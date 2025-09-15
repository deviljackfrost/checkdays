class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :post_content
  has_many :image, dependent: :destroy
  has_one_attached :image
  validates :comment, presence: true

end
