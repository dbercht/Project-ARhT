class Clinic < ActiveRecord::Base
	belongs_to :therapist, :class_name => "User"
	belongs_to :client, :class_name => "User"

	has_many :client_sessions, :select => ['sessions.created_at', :effort, :gesture_id]
	has_and_belongs_to_many :gestures, :select => [:id, :title, :description, :repetitions]

  def find_sessions_by_gesture(gesture_id_p)
    client_sessions.where(:clinic_id => id, :gesture_id => gesture_id_p)
  end

	def find_effort_by_gesture(gesture_id_p)
		@sessions = find_sessions_by_gesture(gesture_id_p)
		@effort = @sessions.map{ |k| {:created_at => k.created_at, :effort => k.effort}}
	end

	def find_rms_by_gesture(gesture_id_p)
		@sessions = find_sessions_by_gesture(gesture_id_p)
		@rms = @sessions.map{ |k| k.rms }
	end

end
