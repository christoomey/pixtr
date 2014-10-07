class User < ActiveRecord::Base
  has_many :galleries
  has_many :group_memberships, foreign_key: "member_id"
  has_many :groups, through: :group_memberships

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  def membership_for(group)
    self.group_memberships.where(group_id: group.id).first
  end
end
