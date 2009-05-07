class PatientPhotosController < ApplicationController
  # GET /patient_photos
  # GET /patient_photos.xml
  def index
   @photo = params[:Filename].to_s
   @test = "Upinder"
   #APP_LOGGER_LOG.info "THIS IS CALLED -  FileName: " + @photo " by test " + @test
  end

  # GET /patient_photos/1
  # GET /patient_photos/1.xml
  def show
    @patient_photo = PatientPhoto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @patient_photo }
    end
  end

  # GET /patient_photos/new
  # GET /patient_photos/new.xml
  def new
    @patient_photo = PatientPhoto.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @patient_photo }
    end
  end

  # GET /patient_photos/1/edit
  def edit
    @patient_photo = PatientPhoto.find(params[:id])
  end

  # POST /patient_photos
  # POST /patient_photos.xml
  def create
    @patient_photo = PatientPhoto.new(params[:patient_photo])

    respond_to do |format|
      if @patient_photo.save
        flash[:notice] = 'PatientPhoto was successfully created.'
        format.html { redirect_to(@patient_photo) }
        format.xml  { render :xml => @patient_photo, :status => :created, :location => @patient_photo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @patient_photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /patient_photos/1
  # PUT /patient_photos/1.xml
  def update
    @patient_photo = PatientPhoto.find(params[:id])

    respond_to do |format|
      if @patient_photo.update_attributes(params[:patient_photo])
        flash[:notice] = 'PatientPhoto was successfully updated.'
        format.html { redirect_to(@patient_photo) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @patient_photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /patient_photos/1
  # DELETE /patient_photos/1.xml
  def destroy
    @patient_photo = PatientPhoto.find(params[:id])
    @patient_photo.destroy

    respond_to do |format|
      format.html { redirect_to(patient_photos_url) }
      format.xml  { head :ok }
    end
  end
end
