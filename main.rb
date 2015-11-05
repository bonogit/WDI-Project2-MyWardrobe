# require 'pry'
require 'sinatra'
# require 'sinatra/reloader'
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

  def log_in?
    !!current_user
  end
end
# close database connection after session
after do
ActiveRecord::Base.connection.close
end

get '/' do
  erb :index
end
# show the whole wardrobe
get '/wardrobe' do
  # redirect to '/signin' unless log_in?
  @category = Category.all
  if params[:category_id].nil? || params[:category_id].empty?
     @garments = Garment.where(user_id: current_user.id)
  else
     @garments = Garment.where(category_id: params[:category_id], user_id: current_user.id)
  end
  erb :wardrobe
end
# show one garment
get '/showgarment/:id' do
  # redirect to '/signin' unless log_in?
  @garment = Garment.find(params[:id])
  erb :showgarment
end

# show update page
get '/updategarment/showedit/:id' do
    # redirect to '/signin' unless log_in?
  @garment = Garment.find(params[:id])
  erb :updategarment
end

put '/updategarment/:id' do
  @gar = Garment.find params[:id]
  @gar.description = params[:description]
  @gar.location = params[:location]
  @gar.brand = params[:brand]
  @gar.size = params[:size]
  @gar.status = params[:status]
  @gar.buy_value = params[:buy_value]
  @gar.buy_currency = params[:buy_currency]
  @gar.buy_date = params[:buy_date]
  @gar.sold_value = params[:sold_value]
  @gar.sold_currency = params[:sold_currency]
  @gar.image = params[:update_image]
  @gar.save
 redirect to '/wardrobe'
end

# getting the add new form
  # redirect to '/signin' unless log_in?
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
@addgarment.record_date = Date.today
@addgarment.user_id = current_user.id
@addgarment.image = params[:update_image]
@addgarment.save
redirect to '/wardrobe'
end

delete '/deletegarment/:id' do
Garment.find(params[:id]).destroy
redirect to '/wardrobe'
end

# get sign up form
get '/regi' do
  erb :regi
end
# get sign in form
get '/signin' do
  erb :signin
end

# creating log in session
post '/session' do
  user =User.find_by(username: params[:username])
  # binding.pry
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect to '/wardrobe'
  else
    redirect to '/signin'
  end
end

post '/session/newuser' do
   @newuser = User.new
   @newuser.username = params[:user]
   @newuser.email = params[:email]
   @newuser.password = params[:password]
   @newuser.save
   redirect to '/'
end

delete '/session' do
  session[:user_id] = nil
  redirect to '/'
end

