class Local < ActiveRecord::Base
  attr_accessible :hh, :name, :percentage, :price, :subarea_id, :value
  belongs_to :subarea
  has_many :systems
end
