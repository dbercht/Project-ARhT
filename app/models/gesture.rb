class Gesture < ActiveRecord::Base
	has_many :gesture_samples
	has_many :classifiers, :through => :gesture_samples
end
