source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

gem 'rails', '~> 6.1.7', '>= 6.1.7.6'

gem "devise_token_auth", "~> 1.2"
gem "active_model_serializers", "~> 0.10.13"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem 'rack-cors', :require => 'rack/cors'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem "factory_bot_rails", "~> 6.1"
  gem "faker", "~> 2.17"
  gem "rspec-rails", "~> 5.0"
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem 'bullet'
  gem 'listen', '~> 3.3'
  # gem 'spring'
  gem "letter_opener", "~> 1.8"
end

group :test do 
  gem "database_cleaner-active_record", "~> 2.0"
  gem "shoulda-matchers", "~> 4.5"
  gem "simplecov", "~> 0.21.2", require: false
end

