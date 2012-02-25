class Gesture < ActiveRecord::Base
	has_many :gesture_samples
	has_many :classifiers, :through => :gesture_samples
	has_many :client_sessions
	has_and_belongs_to_many :clinics

end
