require 'rubygems'
require 'sinatra'
require 'tilt/haml'
require 'app/models/market/user'
require 'app/controllers/main'
require 'app/controllers/authentication'
require 'app/controllers/marketplace'

class App < Sinatra::Base

  use Authentication
  use Main

  enable :sessions
  set :public_folder, 'app/public'

  configure :development do
    # Do data
  end

  # Run, Forrest, run!
  App.run!
end