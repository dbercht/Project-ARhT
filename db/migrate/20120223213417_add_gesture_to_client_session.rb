class AddGestureToClientSession < ActiveRecord::Migration
  def change
    add_column :sessions, :gesture_id, :integer

  end
end
