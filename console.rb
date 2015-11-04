require 'active_record'
require 'pry'
# show the sql in the terminal
ActiveRecord::Base.logger = Logger.new(STDERR)

require_relative 'models/db_config'
require_relative 'models/category'
require_relative 'models/garment'
require_relative 'models/user'


binding.pry