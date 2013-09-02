class Local < ActiveRecord::Base
  attr_accessible :name, :price, :subarea_id
  belongs_to :subarea
  belongs_to :system
end
