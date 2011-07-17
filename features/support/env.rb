ENV['RACK_ENV'] = 'test'

require 'bundler'
Bundler.setup
Bundler.require(:default, ENV["RACK_ENV"].to_sym)

Dir["./models/**/*.rb"].each { |f| require f }
Dir["./apps/**/*.rb"].each { |f| require f }

DataMapper.setup(:default, "sqlite3::memory:")
DataMapper.auto_upgrade!

Capybara.app = Adams::Clover

class CloverWorld
  include Capybara
  include RSpec::Expectations
  include RSpec::Matchers
end

World do
  CloverWorld.new
end
