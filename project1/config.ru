require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'better_errors'
require 'active_record'


# Controllers
require_relative 'controllers/home_controller.rb'
require_relative 'controllers/authors_controller.rb'
require_relative 'controllers/quotes_controller.rb'
require_relative 'controllers/tags_controller.rb'

# Models
require_relative 'models/author.rb'
require_relative 'models/quote.rb'
require_relative 'models/tag.rb'


configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

ActiveRecord::Base.establish_connection({
  adapter: 'postgresql',
  database: 'quotes_db'
})

after { ActiveRecord::Base.connection.close }
