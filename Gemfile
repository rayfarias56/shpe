source 'https://rubygems.org'

gem 'rails', '3.2.13'
gem 'bootstrap-sass',  '2.3.2.1'
gem 'bcrypt-ruby', '3.0.1'
gem 'faker', '1.0.1'


gem 'paperclip', '~> 3.0'
gem 'sqlite3', '~> 1.3.5'
gem 'google-analytics-rails'
gem 'activeadmin'
gem 'google-api-client'
gem 'rollbar', '>= 1.0.0'


# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :development, :test do


  gem 'annotate', '2.5.0'
  gem 'capistrano'
  gem 'pry'
  gem 'better_errors'
  gem 'binding_of_caller'


end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '3.2.5'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer','0.12.1',  :platforms => :ruby

  gem 'uglifier', '1.2.3'
end

gem 'jquery-rails' , '2.0.2'


group :test do
  gem 'cucumber-rails', '1.2.1', :require => false
  gem 'database_cleaner', '0.7.0'
  gem 'rspec-rails', '2.11.0'
  gem 'capybara', '1.1.2'
  gem 'factory_girl_rails', '4.1.0'

end

group :production, :staging do
  gem 'mysql2'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# To use debugger
# gem 'debugger'
