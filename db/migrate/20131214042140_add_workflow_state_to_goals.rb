class AddWorkflowStateToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :workflow_state, :string
  end
end
