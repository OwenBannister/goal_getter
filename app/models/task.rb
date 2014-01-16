class Task < ActiveRecord::Base
	 include Workflow
  #belongs_to :cover, :class_name => 'Template', :foreign_key => 'cover_id', :inverse_of => :documents
  belongs_to :goal

workflow do
  state :todo do
    event :start, :transitions_to => :in_progress
    event :archive, :transitions_to => :archived
       event :complete, :transitions_to => :completed
  end
  state :in_progress do
    event :complete, :transitions_to => :completed
  	event :archive, :transitions_to => :archived
  end
  state :completed
  state :discarded
end

def in_progress?
  current_state == :in_progress
end
def todo?
  current_state == :todo
end

end
