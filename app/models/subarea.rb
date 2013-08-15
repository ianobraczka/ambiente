class Subarea < ActiveRecord::Base
  attr_accessible :area_id, :hh, :name, :percentage, :price, :value
  belongs_to :area
  has_many :locals
  has_many :systems
end
