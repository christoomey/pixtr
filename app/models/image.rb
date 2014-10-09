class Image < ActiveRecord::Base
  belongs_to :gallery
  has_many :comments
  has_many :likes
  has_many :likers, through: :likes, source: :user
  has_many :groupings
  has_many :groups, through: :groupings

  has_many :image_tags
  has_many :tags, through: :image_tags

  validates :name, presence: true
  validates :url, presence: true

  def gallery_name
    gallery.name
  end
end
