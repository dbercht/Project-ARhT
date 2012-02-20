class ClientSessionsController < ApplicationController
	load_and_authorize_resource
	respond_to :json

	def index
		@clinic = User.find(params[:user_id]).inverse_clinic
		#@sessions = ClientSession.find_grouped_by_metric(@clinic.id)
		@sessions = @clinic.client_sessions(:select => [:created_at, :metric_one, :metric_two, :metric_three])
		render :json => @sessions
	end

	def show
	end

end
