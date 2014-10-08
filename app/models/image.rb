class Image < ActiveRecord::Base
  belongs_to :gallery
  has_many :comments
  has_many :likes

  validates :name, presence: true
  validates :url, presence: true
end
