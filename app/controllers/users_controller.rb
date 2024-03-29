#user_controller.rb
class UsersController < ApplicationController
  load_and_authorize_resource
  
  def index
    @users = current_user.clients(:select => [:name, :surname, :email])
  end
  
	def show
		@user = User.find(params[:id])
		@clinic = @user.inverse_clinic(:select => [:id])
		@excercises = @clinic.gestures
		@gesture_samples = GestureSample.where("gesture_id IN (?)", @clinic.gesture_ids).order('gesture_id')
		@gestures = Gesture.all
	  respond_to do |format|
	    format.html
	    format.json { render :status=>200, :json => {:user => @user, :clinic => @clinic, :excercises => @excercises, :gesture_samples => @gesture_samples} }
	  end
	end

  def new
    @user = User.new
		render 'users/registrations/new'
  end
  
  def create
    @user = User.new(params[:user])
		@user.role = User::ROLES[0] #Defining as a client
    if @user.save
			@user.therapist = current_user #Adding to list of current therapist 
      flash[:notice] = "Successfully created User." 
      redirect_to user_path(@user)
    else
      render 'users/registrations/new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
		render 'users/registrations/edit'
  end
  
  def update
    @user = User.find(params[:id])
    params[:user].delete(:password) if params[:user][:password].blank?
    params[:user].delete(:password_confirmation) if params[:user][:password].blank? and params[:user][:password_confirmation].blank?
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated User."
      redirect_to users_path
    else
      render 'users/registrations/edit'
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "Successfully deleted User."
      redirect_to root_path
    end
  end
  
end
