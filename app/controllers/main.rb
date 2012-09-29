require 'erb'

class Main < Sinatra::Application

  def includeERB(path)
    content = File.read($VIEWS_FOLDER + "/" + path)
    t = ERB.new(content)
    t.result(binding)
  end

  get "/" do
    #redirect '/login' unless session[:name]

    @time = Time.now
    @current_name = "session[:name]"
    @users = Market::User.all

    # a global variable is quite hacky, but it seems to be the only way..
    template = ERB.new File.new($VIEWS_FOLDER + "/marketplace.erb").read, nil, "%"
    template.result(binding)
  end

end
