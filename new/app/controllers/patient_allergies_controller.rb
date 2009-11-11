class PatientAllergiesController < ApplicationController
  # GET /patient_allergies
  # GET /patient_allergies.xml
  def index
    @patient_allergies = PatientAllergies.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @patient_allergies }
    end
  end

  # GET /patient_allergies/1
  # GET /patient_allergies/1.xml
  def show
    @patient_allergies = PatientAllergies.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @patient_allergies }
    end
  end

  # GET /patient_allergies/new
  # GET /patient_allergies/new.xml
  def new
    @patient_allergies = PatientAllergies.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @patient_allergies }
    end
  end

  # GET /patient_allergies/1/edit
  def edit
    @patient_allergies = PatientAllergies.find(params[:id])
  end

  # POST /patient_allergies
  # POST /patient_allergies.xml
  def create
    @patient_allergies = PatientAllergies.new(params[:patient_allergies])

    respond_to do |format|
      if @patient_allergies.save
        flash[:notice] = 'PatientAllergies was successfully created.'
        format.html { redirect_to(@patient_allergies) }
        format.xml  { render :xml => @patient_allergies, :status => :created, :location => @patient_allergies }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @patient_allergies.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /patient_allergies/1
  # PUT /patient_allergies/1.xml
  def update
    @patient_allergies = PatientAllergies.find(params[:id])

    respond_to do |format|
      if @patient_allergies.update_attributes(params[:patient_allergies])
        flash[:notice] = 'PatientAllergies was successfully updated.'
        format.html { redirect_to(@patient_allergies) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @patient_allergies.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /patient_allergies/1
  # DELETE /patient_allergies/1.xml
  def destroy
    @patient_allergies = PatientAllergies.find(params[:id])
    @patient_allergies.destroy

    respond_to do |format|
      format.html { redirect_to(patient_allergies_url) }
      format.xml  { head :ok }
    end
  end
end
