require 'net/http'
require 'json'

class PictureOfTheDay
  def fetch_picture
    image_attributes = fetch_image_attributes
    Image.picture_of_the_day or Image.create(image_attributes)
  end

  private

  API_KEY = 'c41Mlbefn95QzZDraVVsGLG49v1aq5BKBgAVYlgB'
  API_URL = "https://api.nasa.gov/planetary/apod?api_key=#{API_KEY}"

  def fetch_image_attributes
    uri = URI(API_URL)
    response = Net::HTTP.get(uri)
    json_response = JSON.parse(response)
    {
      title: json_response['title'],
      url: json_response['url'],
      description: json_response['explanation'],
      copyright: json_response['copyright'],
      is_picture_of_the_day: true
    }
  end
end
