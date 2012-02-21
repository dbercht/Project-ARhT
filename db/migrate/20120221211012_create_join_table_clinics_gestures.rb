class CreateJoinTableClinicsGestures < ActiveRecord::Migration
  def change
		create_table :clinics_gestures, :id => false do |t|
			t.references :clinic, :gesture
		end
		add_index :clinics_gestures, [:clinic_id, :gesture_id]
  end
end
