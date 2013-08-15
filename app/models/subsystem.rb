class Subsystem < ActiveRecord::Base
  attr_accessible :hh, :name, :percentage, :price, :system_id, :total_quantity, :unity, :value
  belongs_to :system
  has_many :subsubsystems
end
