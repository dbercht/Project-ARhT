class ChangeMetricsToDecimalsFromSession < ActiveRecord::Migration
  def up
			change_column(:sessions, :metric_one, :decimal, :precision => 6, :scale =>3)
			change_column(:sessions, :metric_two, :decimal, :precision => 6, :scale =>3)
			change_column(:sessions, :metric_three, :decimal, :precision => 6, :scale =>3)
  end

  def down
  end
end
