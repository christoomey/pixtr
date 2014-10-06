class Comment < ActiveRecord::Base
  belongs_to :user

  validates :body, presence: true

  def self.recent
    order("created_at DESC").limit(5)
  end
end
