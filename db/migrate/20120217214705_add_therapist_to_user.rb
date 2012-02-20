class AddTherapistToUser < ActiveRecord::Migration
  def change
		change_table(:users) do |t|
			t.integer :user_id
		end
  end
end
