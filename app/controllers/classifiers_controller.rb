class ClassifiersController < ApplicationController
	load_and_authorize_resource

  def index
		@classifiers = Classifier.find(:all)
		@gesture = Gesture.find(params[:gesture_id])
  end

  def new
		@classifier = Classifier.new
  end


  # POST /classifiers
  # POST /classifiers.json
  def create
    @classifier = Classifier.new(params[:classifier])

    respond_to do |format|
      if @classifier.save
        format.html { redirect_to root_url, notice: 'Classifier was successfully created.' }
        format.json { render json: @classifier, status: :created, location: @classifier }
      else
        format.html { render action: "new" }
        format.json { render json: @classifier.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
		@classifier = Classifier.find(params[:id])
  end

  # PUT /classifiers/1
  # PUT /classifiers/1.json
  def update
    @classifier = Classifier.find(params[:id])

    respond_to do |format|
      if @classifier.update_attributes(params[:classifier])
        format.html { redirect_to root_url, notice: 'Classifier was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @classifier.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /classifiers/1
  # DELETE /classifiers/1.json
  def destroy
    @classifier = Classifier.find(params[:id])
    @classifier.destroy

    respond_to do |format|
      format.html { redirect_to classifiers_url }
      format.json { head :no_content }
    end
  end
end
