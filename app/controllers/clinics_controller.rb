class ClinicsController < ApplicationController
	load_and_authorize_resource

  # GET /clinics
  # GET /clinics.json
  def index
    @clinics = Clinic.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @clinics }
    end
  end

  # GET /clinics/1
  # GET /clinics/1.json
  def show
		@user = User.find(params[:user_id])
		@clinic = @user.inverse_clinic
		@sessions = @clinic.client_sessions
		@gestures = @clinic.gestures.select('gestures.title, gestures.id')
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sessions }
    end
  end

  # GET /clinics/new
  # GET /clinics/new.json
  def new
    @clinic = Clinic.new
		@gestures = Gesture.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @clinic }
    end
  end

  # GET /clinics/1/edit
  def edit
    @clinic = User.find(params[:user_id]).inverse_clinic
		@gestures = Gesture.all
  end

  # POST /clinics
  # POST /clinics.json
  def create
    @clinic = Clinic.new(params[:clinic])

    respond_to do |format|
      if @clinic.save
        format.html { redirect_to @clinic.client, notice: 'Clinic was successfully created.' }
        format.json { render json: @clinic, status: :created, location: @clinic.client }
      else
        format.html { redirect_to @clinic.client }
        format.json { render json: @clinic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /clinics/1
  # PUT /clinics/1.json
  def update
		@gestures = Gesture.all
		@user = User.find(params[:user_id])
    @clinic = @user.inverse_clinic
    respond_to do |format|
      if @clinic.update_attributes(params[:clinic])
        format.html { redirect_to user_path(@user), notice: 'Clinic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { redirect_to user_path(@user) }
        format.json { render json: @clinic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clinics/1
  # DELETE /clinics/1.json
  def destroy
    @clinic = Clinic.find(params[:id])
    @clinic.destroy

    respond_to do |format|
      format.html { redirect_to users_path }
      format.json { head :no_content }
    end
  end
end
