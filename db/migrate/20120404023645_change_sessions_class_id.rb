class ChangeSessionsClassId < ActiveRecord::Migration
  def change
    remove_column :sessions, :classifier_id
    add_column :sessions, :classifier_id, :integer

  end
end
