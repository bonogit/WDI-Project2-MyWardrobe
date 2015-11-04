#maps class to the dishes table
class Category < ActiveRecord::Base
  has_many :garments
end