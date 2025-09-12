class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :post_content
  
  
  validates :comment, presence: true

end
