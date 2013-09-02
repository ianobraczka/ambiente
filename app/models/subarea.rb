class Subarea < ActiveRecord::Base
  attr_accessible :area_id, :name, :price
  belongs_to :area
  has_many :locals, :dependent => :destroy
  belongs_to :system
end
