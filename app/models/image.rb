class Image < ApplicationRecord
  belongs_to :collection, optional: true
  has_many :comments
  validates :title, :url, presence: true

  def self.picture_of_the_day
    Image.find_by(is_picture_of_the_day: true, created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
  end
end
