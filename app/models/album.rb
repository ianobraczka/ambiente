class Album < ActiveRecord::Base
	attr_accessible :model_id, :model_origin, :image
	
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
end
