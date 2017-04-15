source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.1'
gem 'nokogiri'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.5'
gem 'bcrypt', '~> 3.1.7'
gem 'figaro'
gem 'faraday'
gem 'bootstrap-sass'
gem 'yt'
gem 'omniauth-google-oauth2'
gem 'rails-html-sanitizer'
gem 'bootstrap_form'
gem 'sprockets', '>= 3.0.0'
gem 'sprockets-es6'
gem 'rest-client'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'rspec-rails'
  gem 'capybara'
  gem 'launchy'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'simplecov', require: false
  gem 'vcr'
  gem 'webmock'
  gem 'pry'
  gem 'rb-readline'
  gem 'coolline'
  gem 'faker'
  gem 'shoulda-matchers'
  gem 'poltergeist'
  gem 'phantomjs', :require => 'phantomjs/poltergeist'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
end

group :production do
  gem 'rails_12factor'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
