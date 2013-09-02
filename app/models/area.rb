class Area < ActiveRecord::Base
  attr_accessible :name, :price
  has_many :subareas, :dependent => :destroy

 	def price
 		value = 0
		self.systems.each do |system|
			value += system.price
		end
		value
	end
end
