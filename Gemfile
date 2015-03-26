source 'https://rubygems.org'


gem 'rails', '4.2.0'
gem 'pg'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'responders', '~> 2.0'
gem 'twitter-bootstrap-rails'

group :production do
  gem 'rails_12factor'
  gem 'unicorn'
end

group :development, :test do
  gem 'byebug'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'database_cleaner'
  gem 'rspec-rails'
end

group :test do
  gem "factory_girl_rails", "~> 4.0"
  gem 'shoulda-matchers', require: false
end

ruby '2.2.1'