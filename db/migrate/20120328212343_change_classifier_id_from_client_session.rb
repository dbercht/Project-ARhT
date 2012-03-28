class ChangeClassifierIdFromClientSession < ActiveRecord::Migration
  def up
			change_column(:gesture_samples, :mean, :decimal, :precision => 6, :scale =>3)
			change_column(:gesture_samples, :rms, :decimal, :precision => 6, :scale =>3)
			change_column(:gesture_samples, :fundamental_frequency, :decimal, :precision => 6, :scale =>3)
			change_column(:gesture_samples, :variance, :decimal, :precision => 10, :scale =>1)
  end

  def down
  end
end
