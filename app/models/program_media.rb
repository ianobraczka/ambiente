class ProgramMedia < ActiveRecord::Base
  # attr_accessible :title, :body

  belongs_to :program

  has_attached_file :photo
end
