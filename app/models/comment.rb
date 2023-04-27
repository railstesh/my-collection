class Comment < ApplicationRecord
  belongs_to :image

  validates :body, presence: true
end
