class AddDescriptionToGesture < ActiveRecord::Migration
  def change
    add_column :gestures, :description, :string

    add_column :gestures, :repetitions, :integer

  end
end
