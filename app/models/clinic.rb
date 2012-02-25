class Clinic < ActiveRecord::Base
	belongs_to :therapist, :class_name => "User"
	belongs_to :client, :class_name => "User"

	has_many :client_sessions, :select => ['sessions.created_at', :metric_one, :metric_two, :metric_three, :gesture_id]
	has_and_belongs_to_many :gestures, :select => [:id, :title]

  def find_sessions_by_gesture(gesture_id)
    client_sessions.where :clinic_id => id, :gesture_id => gesture_id
  end

end
