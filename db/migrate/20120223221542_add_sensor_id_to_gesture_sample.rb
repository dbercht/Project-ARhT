class AddSensorIdToGestureSample < ActiveRecord::Migration
  def change
    add_column :gesture_samples, :sensor_id, :integer

  end
end
