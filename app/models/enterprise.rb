class Enterprise < ActiveRecord::Base
  attr_accessible :hh, :name, :percentage, :price, :program_id, :value
  belongs_to :program
  has_many :areas
end
