class AddWorkflowStateToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :workflow_state, :string
  end
end
