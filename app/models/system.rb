class System < ActiveRecord::Base
  attr_accessible :area_id, :hh, :local_id, :name, :percentage, :price, :subarea_id, :total_quantity, :unity, :value
  belongs_to :area
  has_many :subareas
  has_many :locals
  has_many :subsystems
end
