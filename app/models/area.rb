class Area < ActiveRecord::Base
  attr_accessible :enterprise_id, :hh, :name, :percentage, :price, :value
  belongs_to :enterprise
  has_many :subareas
  has_many :systems
end
