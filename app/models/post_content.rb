class PostContent < ApplicationRecord
  belongs_to :user
  has_many :post_comments, dependent: :destroy
 validates :title, presence: true
 validates :caption, presence: true
 validates :content, presence: true
  validate :both_fields_not_blank
  
  def self.ransackable_associations(auth_object = nil)
    ["user"]
  end
  
  def self.ransackable_attributes(auth_object = nil)
    ["caption", "content", "created_at", "id", "title", "updated_at", "user_id"]
  end
  
  def self.search(search)
    if search
      PostContent.where('title LIKE (?)', "%#{search}%")
    else
      PostContent.all
    end
  end
  
  def both_fields_not_blank
    if title.blank? && caption.blank?
      errors.add(:caption, :blank)
      errors.add(:title, :blank)
    end
  end
end
