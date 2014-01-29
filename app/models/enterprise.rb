class Enterprise < ActiveRecord::Base
  attr_accessible :hh, :name, :percentage, :price, :program_id, :value, :weight
  belongs_to :program
  has_many :areas, :dependent => :destroy


  #retorna o investimento feito em dado empreendimento
  def price
  	value = 0
  	self.areas.each do |area|
  		value= value + area.price
  	end
  	value
  end

  # METODOS QUE RETORNAM OS PONDERADORES (HOMEM*HORA, PORCENTAGEM E VALOR)
  
  def hh
    value = 0
    self.areas.each do |area|
      if area.hh != nil then
        value = value + area.hh
      end
    end
    value
  end

  def percentage
    value = 0
    self.areas.each do |area|
      if area.percentage != nil
        value= value + area.percentage
      end
    end
    value
  end

  def value
    value = 0
    self.areas.each do |area|
      if area.value != nil then
        value= value + area.value
      end
    end
    value
  end

  # retorna a quantidade planejada de dado empreendimento (soma das qtds planejadas dos sistemas)
  def planned_quantity
    pq = 0
    unless self.areas.empty?
      self.areas.each do |area|
        pq = pq + area.planned_quantity
      end
    end
    pq
  end

  # retorna a quantidade realizada de dado empreendimento (soma das qtds realizadas dos sistemas)
  def real_quantity
    rq = 0
    unless self.areas.empty?
      self.areas.each do |area|
        rq = rq + area.real_quantity
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
      self.areas.each do |area|
        unless area.planned_quantity == 0
          completed = completed + (area.real_quantity*100/area.planned_quantity)*area.weight_variable(weight)
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
