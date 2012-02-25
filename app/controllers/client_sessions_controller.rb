class ClientSessionsController < ApplicationController
	load_and_authorize_resource
	respond_to :json

	def index
		@clinic = User.find(params[:user_id]).inverse_clinic
		#@sessions = ClientSession.find_grouped_by_metric(@clinic.id)
		@sessions = @clinic.find_sessions_by_gesture(params[:gesture_id])
		render :json => @sessions
	end

	def show
	end

end
