require 'erb'
def relative path
  File.join(File.dirname(__FILE__), path)
end
require relative('../../app/models/market/item')
require relative('../../app/models/market/user')

class Marketplace < Sinatra::Application

  post "/buyItem" do
    #redirect '/login' unless session[:name]

    puts "I was called! Test: " + params[:item] + ".. Test2: " + params[:owner]
  end

end
