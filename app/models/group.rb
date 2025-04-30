class Group < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users
  
  enum status: { 未参加: 0, 参加: 1 }

  validates :name, presence: true
  validates :introduction, presence: true

  def joined_by?(user)
    group_users.exists?(user_id: user.id)
  end
  
  user = User.find(1)
group = Group.find(1)

 if group.joined_by?(user)
  puts "#{user.name} は #{group.name} グループに参加しています"
 else
  puts "#{user.name} は #{group.name} グループに参加していません"
 end
end
