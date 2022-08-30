class CreateSteps < ActiveRecord::Migration[7.0]
  def change
    create_table :steps do |t|
      t.text :instruction
      t.integer :order
      t.text :info
      t.references :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
