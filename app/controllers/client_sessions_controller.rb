class ClientSessionsController < ApplicationController
	load_and_authorize_resource
	respond_to :json

	def index
		@clinic = User.find(params[:user_id]).inverse_clinic
		#@sessions = ClientSession.find_grouped_by_metric(@clinic.id)
		@sessions = @clinic.find_sessions_by_gesture(params[:gesture_id])
		@effort = @clinic.find_effort_by_gesture(params[:gesture_id])
		render :json => {:effort => @effort}
	end

	def create
		@cs = ClientSession.new(:clinic_id => params[:clinic_id], :effort => params[:effort], :gesture_id => params[:gesture_id], :classifier_id => params[:classifier_id])
		@cs.save
	end

	def show
	end

end
