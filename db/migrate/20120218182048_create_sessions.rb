class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.references :clinic
      t.integer :metric_one
      t.integer :metric_two
      t.integer :metric_three

      t.timestamps
    end
    add_index :sessions, :clinic_id
  end
end
