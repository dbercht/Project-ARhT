class CreateClinics < ActiveRecord::Migration
  def change
    create_table :clinics do |t|
      t.integer :therapist_id
      t.integer :client_id

      t.timestamps
    end
  end
end
