class Clinic < ActiveRecord::Base
	belongs_to :therapist, :class_name => "User"
	belongs_to :client, :class_name => "User"

	has_many :client_sessions, :select => ['sessions.created_at', :signal_length, :rms, :gesture_id]
	has_and_belongs_to_many :gestures, :select => [:id, :title]

  def find_sessions_by_gesture(gesture_id_p)
    client_sessions.where(:clinic_id => id, :gesture_id => gesture_id_p)
  end

	def find_effort_by_gesture(gesture_id_p)
		@sessions = find_sessions_by_gesture(gesture_id_p)
		@signal_length = @sessions.map{ |k| [k.created_at, k.signal_length, k.rms] }
		@sig_len_avg = self.connection.execute("SELECT AVG(signal_length) FROM gesture_samples WHERE gesture_id = #{gesture_id_p}" ).first[0]
		@rms_min = self.connection.execute("SELECT MIN(rms) FROM gesture_samples WHERE gesture_id = #{gesture_id_p}" ).first[0]
		@rms_max = self.connection.execute("SELECT MAX(rms) FROM gesture_samples WHERE gesture_id = #{gesture_id_p}" ).first[0]
		@effort = @sessions.map{ |k| {:created_at => k.created_at, :effort => 100/2*((k.rms-@rms_min)/(@rms_max-@rms_min))*(1-(k.signal_length-@sig_len_avg).abs/@sig_len_avg)}}
	end

	def find_rms_by_gesture(gesture_id_p)
		@sessions = find_sessions_by_gesture(gesture_id_p)
		@rms = @sessions.map{ |k| k.rms }
	end

end
