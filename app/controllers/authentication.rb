require 'tilt/haml'
def relative path
  File.join(File.dirname(__FILE__), path)
end
require relative('../../app/models/market/user')

class Authentication < Sinatra::Application

end