class StaticController < ApplicationController
	before_filter :authenticate_user!

	def home
		if(current_user.therapist?)
			redirect_to users_path
		end
	end
end
