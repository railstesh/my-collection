json.extract! image, :id, :title, :description, :url, :created_at, :updated_at
json.url image_url(image, format: :json)
