# frozen_string_literal: true

class PictureOfTheDayController < ApplicationController
  def index
    @picture_of_the_day = ::PictureOfTheDay.new

    render json: @picture_of_the_day.fetch_picture, status: :created
  end
end
