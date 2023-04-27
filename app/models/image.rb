# frozen_string_literal: true

class Image < ApplicationRecord
  belongs_to :collection, optional: true

  validates :title, :description, :url, presence: true
  validates :url, format: { with: URI::DEFAULT_PARSER.make_regexp }, if: proc { url.present? }

  has_many :comments, dependent: :destroy

  def self.picture_of_the_day
    Image.find_by(is_picture_of_the_day: true, created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
  end
end
