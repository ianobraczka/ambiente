class Subsystem < ActiveRecord::Base
	attr_accessible :hh, :name, :current_planning_id, :percentage, :price, :system_id, :total_quantity, :unity, :value, :weight, :image
	has_attached_file :image
	belongs_to :system
	has_many :subsubsystems, :dependent => :destroy
	has_many :plannings, as: :plannable 

	def financeiro
		v = 0
		v2 = 0
		subsubsystems.each do |subsub|
			data = subsub.financeiro
			v += data["value_planned"]
			v2 += data["value_real"]
		end

		r = Hash.new

		r["value_planned"] = v
		r["value_real"] = v2

		r
	end

	def avanco_fisico_ponderado

		base = [[0 ,0 , 0],[0 ,0 , 0],[0 ,0 , 0],[0 ,0 , 0]]
		subsubsystems.each do |subsub|
			if subsub.avanco_fisico_ponderado
				data = subsub.avanco_fisico_ponderado.last

				for i in 0..data.length - 1
					for j in 0..data[i].length - 1
						base[i][j] += data[i][j]
					end
				end
			end
		end

		base
	end

	def has_desagregation?
		if self.subsubsystems.empty? then
			return false
		else
			return true
		end
	end

	def current_planning
		Planning.find(self.current_planning_id)
	end

	def current_period
		current_planning.current_period
	end

	def mult
		if weight == 0 then
			mult = self.value
		elsif weight == 2 or weight == 3 then
			mult = self.hh
		elsif weight == 1 then
			mult = self.percentage
		end
		mult
	end

	def price
		subsubsystems = self.subsubsystems
		if subsubsystems.empty? 
			self.attributes["price"] 
		else
			self.subsubsystems.map(&:price).sum
		end
	end

	def hh
		subsubsystems = self.subsubsystems
		if subsubsystems.empty? 
			if self.attributes["hh"] != nil then
				self.attributes["hh"]
			else
				0
			end
		else
			self.subsubsystems.map(&:hh).sum
		end
	end

	def percentage
		subsubsystems = self.subsubsystems
		if subsubsystems.empty? 
			if self.attributes["percentage"] != nil then
				self.attributes["percentage"]
			else
				0
			end
		else
			self.subsubsystems.map(&:percentage).sum
		end
	end

	def value
		subsubsystems = self.subsubsystems
		if subsubsystems.empty? 
			if self.attributes["value"] != nil then
				self.attributes["value"]
			else
				0
			end
		else
			self.subsubsystems.map(&:value).sum
		end
	end

	def real_quantity
		aq = 0
		if self.subsubsystems.empty?
			self.plannings.each do |planning| 
				aq = aq + planning.real_quantity
			end
		else
			self.subsubsystems.each do |subsubsystem|
				aq = aq + subsubsystem.real_quantity
			end
		end
		aq
	end

	def planned_quantity
		pq = 0
		if self.subsubsystems.empty?
			self.plannings.each do |planning| 
				pq = pq + planning.planned_quantity
			end
		else
			self.subsubsystems.each do |subsubsystem|
				pq = pq + subsubsystem.planned_quantity
			end
		end
		pq
	end

	def current_planning
		self.plannings.last
	end

	def completed
		if self.planned_quantity == nil || self.real_quantity == nil
			return 0
		elsif self.real_quantity == 0 || self.planned_quantity == 0
			return 0
		else
			completed = 0
			self.subsubsystems.each do |subsubsystem|
				unless subsubsystem.planned_quantity == 0
					completed = completed + (subsubsystem.real_quantity*100/subsubsystem.planned_quantity)*subsubsystem.weight_variable(weight)
				end
			end
			(completed/mult).round
		end
	end

	def weight_variable (weight)
		if weight == 0 then
			mult = self.value
		elsif weight == 2 or weight == 3 then
			mult = self.hh
		elsif weight == 1 then
			mult = self.percentage
		end
		mult
	end

end
