source 'http://rubygems.org'

gem 'rails', '3.1.1'
gem 'sass-rails'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'uglifier', '>= 1.0.3'
end

gem 'fancybox-rails'
gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

gem 'ruby-debug19', :require => 'ruby-debug'
gem 'database_cleaner', group: :development

group :development do
  gem 'capistrano'
end

group 'production' do
  gem 'pg'
end

group :test, :development do
  gem 'rspec-rails'
  gem 'launchy'
end

group :test do
  # Pretty printed test output
  gem 'turn', '< 0.8.3'
  gem 'cucumber-rails'
  gem 'factory_girl_rails'
end
