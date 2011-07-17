source "http://rubygems.org"
source "http://gems.github.com"

gem 'rack'
gem 'sinatra'
gem 'haml'
gem 'rdiscount'
gem 'builder'
gem 'dm-core', '~> 1.1.0'
gem 'dm-validations', '~> 1.1.0'
gem 'dm-migrations', '~> 1.1.0'
gem 'dm-timestamps', '~> 1.1.0'
gem 'dm-is-slug', :git => "git://github.com/brianflanagan/dm-is-slug.git"

group :development do
  gem 'shotgun'
  gem 'thin'
  gem 'sqlite3'
  gem 'dm-sqlite-adapter', '~> 1.1.0'
end

group :test do
  gem 'rspec'
  gem 'rack-test', :require => "rack/test"
  gem 'webrat'
  gem 'cucumber'
  gem 'capybara', :require => "capybara/cucumber"
  gem 'sqlite3'
  gem 'dm-sqlite-adapter', '~> 1.1.0'
end

group :production do
  gem 'dm-postgres-adapter', '~> 1.1.0'
end