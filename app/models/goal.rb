class Goal < ActiveRecord::Base
	 include Workflow
   has_many :tasks

workflow do
  state :future do
    event :start, :transitions_to => :in_progress
    event :remove, :transitions_to => :discarded
  end
  state :in_progress do
    event :complete, :transitions_to => :completed
  	event :remove, :transitions_to => :discarded
  end
  state :completed
  state :discarded
end


def get_open_tasks
tasks.select {|t| t.current_state.name == :in_progress ||  t.current_state.name == :todo}
end

def get_completed_tasks
tasks.select {|t| t.current_state.name == :completed}
end
end
