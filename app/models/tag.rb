class Tag < ActiveRecord::Base
  has_many :image_tags
  has_many :images, through: :image_tags

  validates :text, presence: true, uniqueness: true

  def to_param
    text
  end

  def image_count
    images.count
  end
end
