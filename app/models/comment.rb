# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :image

  validates :body, presence: true
end
