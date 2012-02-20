class GesturesController < ApplicationController
	load_and_authorize_resource

  def index
		@gestures = Gesture.find(:all)
  end

  def new
		@gesture = Gesture.new
  end


  # POST /gestures
  # POST /gestures.json
  def create
    @gesture = Gesture.new(params[:gesture])

    respond_to do |format|
      if @gesture.save
        format.html { redirect_to @gesture, notice: 'Gesture was successfully created.' }
        format.json { render json: @gesture, status: :created, location: @gesture }
      else
        format.html { render action: "new" }
        format.json { render json: @gesture.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
		@gesture = Gesture.find(params[:id])
  end

  # PUT /gestures/1
  # PUT /gestures/1.json
  def update
    @gesture = Gesture.find(params[:id])

    respond_to do |format|
      if @gesture.update_attributes(params[:gesture])
        format.html { redirect_to @gesture, notice: 'Gesture was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gesture.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /gestures/1
  # DELETE /gestures/1.json
  def destroy
    @gesture = Gesture.find(params[:id])
    @gesture.destroy

    respond_to do |format|
      format.html { redirect_to gestures_url }
      format.json { head :no_content }
    end
  end
end
