class PostContent < ApplicationRecord
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :image, dependent: :destroy
  has_one_attached :image
 validates :title, presence: true
 validates :caption, presence: true
  validate :both_fields_not_blank
  
 
  
  def self.ransackable_associations(auth_object = nil)
    ["user"]
  end
  
  def self.ransackable_attributes(auth_object = nil)
    ["caption", "content", "created_at", "id", "title", "updated_at", "user_id"]
  end
  
def self.search(search)
  errors = {}
  if search.blank?
    errors[:search] = "検索ワードを入力してください"
  end

  if errors.any?
    return { errors: errors }
  else
    PostContent.where('title LIKE ? OR caption LIKE ?', "%#{search}%", "%#{search}%")
  end
end
  
  def both_fields_not_blank
    if title.blank? && caption.blank?
      errors.add(:caption, :blank)
      errors.add(:title, :blank)
    end
  end
end
