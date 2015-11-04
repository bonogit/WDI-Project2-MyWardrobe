#maps class to the dishes table
class Garment < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
end
