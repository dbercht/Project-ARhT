class GestureSamplesController < ApplicationController
	load_and_authorize_resource

  def index
		@gesture = Gesture.find(params[:gesture_id])
		@classifier = Classifier.find(params[:classifier_id])
		@gestures_samples = GestureSample.find(:all, :conditions => {:gesture_id => params[:gesture_id], :classifier_id => params[:classifier_id]}) 
  end

  def new
		@gesture = Gesture.find(params[:gesture_id])
		@classifier = Classifier.find(params[:classifier_id])
		@gesture_sample = GestureSample.new
  end

  # POST /gestures/:gesture_id/gesture_samples
  # POST /gestures/:gesture_id/gesture_samples.json
  def create
		@gesture = Gesture.find(params[:gesture_id])
    @classifier = Classifier.find(params[:classifier_id])
		@gesture_sample = GestureSample.create(params[:gesture_sample])
		@gesture_sample.classifier = @classifier
		@gesture_sample.gesture = @gesture
    respond_to do |format|
      if @gesture_sample.save
        format.html { redirect_to @gesture, notice: 'Gesture Sample was successfully created.' }
        format.json { render json: @gesture_sample, status: :created, location: root_url }
      else
        format.html { render action: "new" }
        format.json { render json: @gesture_sample.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gestures/1
  # DELETE /gestures/1.json
  def destroy
    @gesture_sample = GestureSample.find(params[:id])
    @gesture_sample.destroy

    respond_to do |format|
      format.html { redirect_to gesture_url(Gesture.find(params[:gesture_id])) }
      format.json { head :no_content }
    end
  end
end
