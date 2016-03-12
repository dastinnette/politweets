source "https://rubygems.org"
ruby '2.2.2'

gem 'rails', '4.2.5.1'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'figaro'
gem 'pg'
gem 'omniauth-twitter'
gem 'twitter'
gem 'geocoder'
gem 'chartkick'
gem 'dalli'

group :production do
  gem 'rails_12factor'
end

group :development, :test do
  gem 'pry'
  gem 'rspec-rails', '~> 3.0'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'selenium-webdriver'
end

group :development do
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'quiet_assets'
end

group :test do
  gem 'simplecov', require: false, :group => :test
  gem 'webmock'
  gem 'vcr'
end
