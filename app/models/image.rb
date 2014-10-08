class Image < ActiveRecord::Base
  belongs_to :gallery
  has_many :comments
  has_many :likes
  has_many :likers, through: :likes, source: :user

  validates :name, presence: true
  validates :url, presence: true
end
