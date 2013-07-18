class Program < ActiveRecord::Base
  attr_accessible :hh, :name, :percentage, :price, :value
  has_many :enterprises
end
