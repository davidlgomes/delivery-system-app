# exit on error
bundle update --ruby
set -o errexit

bundle update --ruby
bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean
bundle exec rails db:migrate

#if you have seeds to run add:
# bundle exec rails db:seed
