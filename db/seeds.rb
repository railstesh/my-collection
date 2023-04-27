if Collection.count.zero?
  3.times do |collection|
    Collection.create({ name: Faker::Lorem.sentence, thumbnail_url: "https://picsum.photos/200/300/?blur", description: Faker::Lorem.paragraph })
  end
end

if Image.count.zero?
  images = [
    { title: Faker::Lorem.sentence, description: Faker::Lorem.paragraph, url: "https://picsum.photos/id/237/200/300", copyright: Faker::Name.name, collection_id: Collection.first.id },
    { title: Faker::Lorem.sentence, description: Faker::Lorem.paragraph, url: "https://picsum.photos/seed/picsum/200/300", copyright: Faker::Name.name },
    { title: Faker::Lorem.sentence, description: Faker::Lorem.paragraph, url: "https://picsum.photos/200/300?grayscale", copyright: Faker::Name.name }
  ]

  images.each do |image|
    Image.create(image)
  end

  Image.all.find_each do |image|
    image.comments.create(body: Faker::Lorem.paragraph)
  end
end
