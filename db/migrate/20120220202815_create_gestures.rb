class CreateGestures < ActiveRecord::Migration
  def change
    create_table :gestures do |t|
      t.text :title

      t.timestamps
    end
  end
end
