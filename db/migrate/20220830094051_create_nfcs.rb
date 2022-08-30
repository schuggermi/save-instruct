class CreateNfcs < ActiveRecord::Migration[7.0]
  def change
    create_table :nfcs do |t|
      t.string :serial_number
      t.string :position
      t.string :url
      t.references :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
