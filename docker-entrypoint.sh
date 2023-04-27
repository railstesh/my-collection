yarn install

if [ "${RAILS_ENV}" = "production" ]; then
  # Verify all the production gems are installed
  bundle check
  if [ ! -d "/app/public/uv" ]; then
      bundle exec rake assets:clean assets:precompile
  fi
else
  # install any missing development gems (as we can tweak the development container without rebuilding it)
  bundle check || bundle install --without production
fi

bundle exec rails db:create
bundle exec rails db:migrate
bundle exec rails db:seed

rm -f /app/tmp/pids/server.pid
bundle exec rails s -p 3000 -b '0.0.0.0'