class AddRolesToUser < ActiveRecord::Migration
  def change
		change_table(:users) do |t|
			t.string :role, :default => 'Client'
		end
  end
end
