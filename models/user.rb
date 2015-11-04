class User < ActiveRecord::Base
  #give us the password method, authenticate
  has_secure_password
  has_many :garments
end
