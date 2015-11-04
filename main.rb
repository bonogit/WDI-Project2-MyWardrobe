require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'pg'
# require 'carrierwave'

enable :sessions
require_relative 'models/db_config'
require_relative 'models/category'
require_relative 'models/garment'
require_relative 'models/user'

helpers do
  def link(label, href)
    "<a href='#{ href }'>#{ label }</a>"
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end
end

get '/' do
  erb :index
end
# show the whole wardrobe
get '/wardrobe' do
  @category = Category.all
  
  if params[:category_id].nil? || params[:category_id].empty?
     @garments = Garment.all
  else
     @garments = Garment.where(category_id: params[:category_id])
  end

  erb :wardrobe
end
# show one garment
get '/showgarment/:id' do
  @garment = Garment.find(params[:id])
  erb :showgarment
end

# show update page
get '/updategarment/showedit/:id' do
  @garment = Garment.find(params[:id])
  erb :updategarment
end

put '/updategarment/:id' do
  @gar = Garment.find params[:id]
  @gar.location = params[:location]
  @gar.brand = params[:brand]
  @gar.size = params[:size]
  @gar.status = params[:status]
  @gar.buy_value = params[:buy_value]
  @gar.buy_currency = params[:buy_currency]
  @gar.buy_date = params[:buy_date]
  @gar.sold_value = params[:sold_value]
  @gar.sold_currency = params[:sold_currency]
  @gar.save
 redirect to '/wardrobe'
end

# getting the add new form
get '/addgarment/form' do
erb :addgarment
end
# add new garment
post '/addgarment' do
@addgarment = Garment.new
@addgarment.garment_name = params[:garment_name]
@addgarment.location = params[:location]
@addgarment.brand = params[:brand]
@addgarment.size = params[:size]
@addgarment.status = params[:status]
@addgarment.buy_value = params[:buy_value]
@addgarment.buy_currency = params[:buy_currency]
@addgarment.buy_date = params[:buy_date]
@addgarment.sold_value = params[:sold_value]
@addgarment.sold_currency = params[:sold_currency]
@addgarment.save
redirect to '/wardrobe'
end

delete '/deletegarment/:id' do
Garment.find(params[:id]).destroy
redirect to '/wardrobe'
end

get '/regi' do
  erb :regi
end

get '/signin' do
  erb :signin
end

