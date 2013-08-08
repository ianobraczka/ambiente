class Subsystem < ActiveRecord::Base
  attr_accessible :hh, :name, :percentage, :price, :system_id, :total_quantity, :unity, :value
end
