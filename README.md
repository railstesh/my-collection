# Rails Application with NASA Picture of the Day API

This is a Ruby on Rails application that uses NASA's Picture of the Day API to display a daily image from space. In addition, the application allows users to create their own images, post comments, and add them to their collections.

## API Key

To use NASA's Picture of the Day API, you'll need to obtain an API key from [NASA Open APIs](https://api.nasa.gov/). Once you have the key, add it to .env.

## Usage

1. On the homepage, you will see the NASA picture of the day. Click on the "Reveal Picture" button to view the picture details.
2. To create your own image, click on the "Image" link in the nav and fill out the form.
3. To add comments to an image, click on the "Image" link in the nav, select a picture click on the "View Image" button and scroll down to the comments section. Enter your comment and click the "Post Comment" button.
4. To create a new collection, click on the "Collection" link in the and fill out the form.
5. To add an image to a collection, go to the image and select the collection from the dropdown menu on the header.

## Running this app

You'll need to have Docker installed. It's available on Windows, macOS and most distros of Linux.
This project uses a specific Docker Compose.

The services used are

- Ruby 3.0
- Rails 6
- PostgreSQl

#### Clone this repo anywhere you want and move into the directory:

```sh
  git clone https://github.com/railstesh/my-collection.git
  cd my-collection
```

#### Copy an example .env file because the real one is git ignored:

```sh
cp .env.example .env
```

#### Build everything:

*The first time you run this it's going to take 5-10 minutes depending on your internet connection speed and computer's hardware specs. That's because it's going to download a few Docker images and build the Ruby + Yarn dependencies.

```sh
docker compose up --build
```

Now that everything is built and running we can treat it like any other Rails app.

#### Check it out in a browser:

Visit <http://localhost:3000> in your favorite browser.


#### Running the test suite:

```sh
# You can run this from the same terminal as before.
docker-compose run --rm -e "RAILS_ENV=test" web bundle exec rspec
```

#### Stopping everything:

```sh
# Stop the containers and remove a few Docker related resources associated to this project.
docker compose down
```