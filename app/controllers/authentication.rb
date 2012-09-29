require 'erb'
def relative path
  File.join(File.dirname(__FILE__), path)
end
require relative('../../app/models/market/user')

class Authentication < Sinatra::Application

  post "/login" do
    username = params[:username]
    password = params[:password]

    fail "Empty username or password" if username.nil? or password.nil?
    fail "Password wrong!" if password != username

    session[:username] = username
    redirect '/'
  end

  get "/logout" do
    session[:username] = nil
    redirect '/login'
  end

end