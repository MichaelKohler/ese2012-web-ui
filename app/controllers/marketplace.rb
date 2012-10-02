require 'erb'
def relative path
  File.join(File.dirname(__FILE__), path)
end
require relative('../../app/models/market/item')
require relative('../../app/models/market/user')

class Marketplace < Sinatra::Application

  post "/buy_item" do
    redirect '/login' unless session[:name]

    @owner = Market::User.user_by_name(params[:owner])
    @item = @owner.item_by_name(params[:item])
    
    @current_user = Market::User.user_by_name(session[:name])
    @current_user.buy_item(@item) if @current_user.buy_item?(@item)
    
    # this does what it needs to
    # but still returns a 500 error..
    # yesterday this worked with the same code, intermittent?
  end

end
