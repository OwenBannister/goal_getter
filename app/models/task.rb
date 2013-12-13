class Task < ActiveRecord::Base
  #belongs_to :cover, :class_name => 'Template', :foreign_key => 'cover_id', :inverse_of => :documents
  belongs_to :goal
end
