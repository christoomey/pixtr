class Tag < ActiveRecord::Base
  validates :text, presence: true
end
