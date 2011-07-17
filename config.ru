ENV["RACK_ENV"] ||= "development"

require 'bundler'
Bundler.setup
Bundler.require(:default, ENV["RACK_ENV"].to_sym)

Dir["./models/**/*.rb"].each { |f| require f }
Dir["./apps/**/*.rb"].each { |f| require f }

DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/db/development.db")
DataMapper.auto_upgrade!

run Rack::URLMap.new({
  "/"    => Adams::Clover,
  "/xml" => Adams::Henry
})