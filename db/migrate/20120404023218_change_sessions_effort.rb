class ChangeSessionsEffort < ActiveRecord::Migration
  def change
    remove_column :sessions, :rms
    remove_column :sessions, :signal_length

    add_column :sessions, :effort, :integer

  end
end
