class User < ActiveRecord::Base
  has_many :galleries
  has_many :group_memberships, foreign_key: "member_id"
  has_many :groups, through: :group_memberships
  has_many :likes
  has_many :liked_images, through: :likes, source: :image

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  def membership_for(group)
    group_memberships.where(group_id: group.id).first
  end

  def like(image)
    liked_images << image
  end

  def unlike(image)
    liked_images.destroy(image)
  end

  def likes?(image)
    liked_images.include?(image)
  end
end
