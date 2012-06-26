source 'https://rubygems.org'

gem 'rails', '3.2.6'

gem 'devise'
gem 'heroku'

# moving this out of assets because heroku needs it in prod too
# see https://github.com/seyhunak/twitter-bootstrap-rails/issues/123
gem 'twitter-bootstrap-rails'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'less-rails'
end

gem 'jquery-rails'

group :test, :development do
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'factory_girl_rails', '1.2.0'
  gem 'powder'
end

group :production do
  gem 'pg'
end
