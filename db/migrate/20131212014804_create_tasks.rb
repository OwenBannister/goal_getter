class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.datetime :completion_date
      t.datetime :start_date
      t.float :money_available

      t.timestamps
    end
  end
end
