class CreateEmployeeTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :employee_tasks do |t|
      t.boolean :task_done
      t.references :task, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
