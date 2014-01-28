class Area < ActiveRecord::Base
  attr_accessible :name, :price, :weight, :enterprise_id
  has_many :subareas, :dependent => :destroy
  belongs_to :enterprise
  has_many :systems
 	
  	#retorna a quantidade de investimento em certa area (soma dos investimentos dos sistemas que ela possui)
 	 #retorna o investimento feito em dado empreendimento
  def price
  	value = 0
  	self.systems.each do |system|
  		value= value + system.price
  	end
  	value
  end

  # METODOS QUE RETORNAM OS PONDERADORES (HOMEM*HORA, PORCENTAGEM E VALOR)
  
  def hh
    value = 0
    self.systems.each do |system|
      if system.hh != nil then
        value = value + system.hh
      end
    end
    value
  end

  def percentage
    value = 0
    self.systems.each do |system|
      if system.percentage != nil
        value= value + system.percentage
      end
    end
    value
  end

  def value
    value = 0
    self.systems.each do |system|
      if system.value != nil then
        value= value + system.value
      end
    end
    value
  end

  # retorna a quantidade planejada de dado empreendimento (soma das qtds planejadas dos sistemas)
  def planned_quantity
    pq = 0
    if self.systems.empty?
      0
    else
      self.systems.each do |system|
        pq = pq + system.planned_quantity
      end
    end
    pq
  end

  # retorna a quantidade realizada de dado empreendimento (soma das qtds realizadas dos sistemas)
  def real_quantity
    rq = 0
    if self.systems.empty?
      0
    else
      self.systems.each do |system|
        rq = rq + system.real_quantity
      end
    end
    rq
  end

  # retorna a porcentagem completa de um empreendimento
  def completed
    if self.planned_quantity == nil || self.real_quantity == nil
      return 0
    elsif self.real_quantity == 0 || self.planned_quantity == 0
      return 0
    else
      completed = 0
      self.systems.each do |system|
        unless system.planned_quantity == 0
          completed = completed + (system.real_quantity*100/system.planned_quantity)*system.weight_variable(weight)
        end
      end
      (completed/mult).round
    end
  end
  
  def chosen
    if self.weight == 1 then
      mult = self.value
    elsif self.weight == 2 then
      mult = self.hh
    elsif self.weight == 3 then
      mult = self.percentage
    end
  end

  def weight_variable (recieved)
    if recieved == 1 then
      mult = self.value
    elsif recieved == 2 then
      mult = self.hh
    elsif recieved == 3 then
      mult = self.percentage
    end
  end

  def mult
    if weight == 1 then
      mult = self.value
    elsif weight == 2 then
      mult = self.hh
    elsif weight == 3 then
      mult = self.percentage
    end
    mult
  end

end
