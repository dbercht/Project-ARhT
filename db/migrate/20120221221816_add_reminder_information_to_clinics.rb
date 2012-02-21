class AddReminderInformationToClinics < ActiveRecord::Migration
  def change
    add_column :clinics, :therapy_repetitions, :integer, :default => 8
    add_column :clinics, :therapy_repetition_interval, :integer, :default => 60
    add_column :clinics, :therapy_start_hour, :integer, :default => 10 
		add_column :clinics, :therapy_start_minute, :integer, :default => 0
  end
end
