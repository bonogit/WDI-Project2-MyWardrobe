require 'carrierwave'
class ImageUploader < CarrierWave::Uploader::Base
  storage :file
end

require 'carrierwave/orm/activerecord'
#maps class 

class Garment < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
   mount_uploader :image, ImageUploader
end
