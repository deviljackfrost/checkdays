class PostContent < ApplicationRecord
  belongs_to :user
 validates :title, presence: true
 validates :caption, presence: true
 
  validate :both_fields_not_blank

  def both_fields_not_blank
    if title.blank? && caption.blank?
      errors.add(:caption, :blank)
      errors.add(:title, :blank)
    end
  end
end
