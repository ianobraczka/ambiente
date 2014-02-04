class Image < ActiveRecord::Base
	belongs_to :imageable, :polymorphic => true

	attr_accessible :imageable_id, :imagiable_type
end
