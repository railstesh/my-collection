# frozen_string_literal: true

class Collection < ApplicationRecord
  has_many :images

  validates :name, :thumbnail_url, :description, presence: true
  validates :thumbnail_url, format: { with: URI::DEFAULT_PARSER.make_regexp }, if: proc { thumbnail_url.present? }

  before_destroy :update_images

  private

  def update_images
    images.update_all(collection_id: nil)
  end
end
