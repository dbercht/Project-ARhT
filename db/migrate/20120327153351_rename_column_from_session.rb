class RenameColumnFromSession < ActiveRecord::Migration
  def up
    rename_column :sessions, :metric_one, :signal_length
    rename_column :sessions, :metric_two, :rms
		rename_column :sessions, :metric_three, :classifier_id
  end

  def down
  end
end
