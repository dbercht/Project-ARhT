class Classifier < ActiveRecord::Base
	has_many :gesture_samples
	has_many :gestures, :through => :gesture_samples
end
