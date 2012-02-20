class Clinic < ActiveRecord::Base
	belongs_to :therapist, :class_name => "User"
	belongs_to :client, :class_name => "User"

	has_many :client_sessions

end
