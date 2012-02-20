class CreateGestureSamples < ActiveRecord::Migration
  def change
    create_table :gesture_samples do |t|
      t.integer :mean
      t.integer :signal_length
      t.integer :rms
      t.decimal :vertices, :precision => 6, :scale =>3
      t.decimal :baseline_crosses, :precision => 6, :scale =>3
      t.integer :fundamental_frequency
      t.integer :variance
      t.integer :region_length
      t.references :classifier
      t.references :gesture
      t.timestamps
    end
  end
end
