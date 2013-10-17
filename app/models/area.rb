class Area < ActiveRecord::Base
  attr_accessible :name, :price
  has_many :subareas, :dependent => :destroy
  has_and_belongs_to_many :systems
 	def price
 		value = 0
		self.systems.each do |system|
			value = value + system.price
		end
		value
	end

	def completed
		value = 0
		self.systems.each do |system|
			value = value + system.completed
		end
		if !self.systems.empty? then
			value/self.systems.count
		else
			100
		end
	end
end
