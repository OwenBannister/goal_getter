class RemoveTaskIdFromGoals < ActiveRecord::Migration
  def change
    remove_column :goals, :task_id, :integer
  end
end
