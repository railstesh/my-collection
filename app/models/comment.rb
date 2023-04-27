class Comment < ApplicationRecord
  belongs_to :image, dependent: :destroy
end
