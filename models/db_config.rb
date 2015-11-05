require 'active_record'

options = {
  adapter: 'postgresql',
  # username: 'bono'  only need when the user is created
  database: 'mywardrobe'
}

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || options)