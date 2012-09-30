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
    
    # to figure out: why does a redirect here not work?
    # is it because of the asynchronous POST call in marketplace.erb?
  end

end
