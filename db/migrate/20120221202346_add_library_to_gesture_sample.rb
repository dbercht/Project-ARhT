class AddLibraryToGestureSample < ActiveRecord::Migration
  def change
    add_column :gesture_samples, :library_sample, :boolean, :default => false

  end
end
