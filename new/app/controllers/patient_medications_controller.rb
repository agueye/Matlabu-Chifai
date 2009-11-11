class PatientMedicationsController < ApplicationController
  # GET /patient_medications
  # GET /patient_medications.xml
  def index
    @patient_medications = PatientMedications.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @patient_medications }
    end
  end

  # GET /patient_medications/1
  # GET /patient_medications/1.xml
  def show
    @patient_medications = PatientMedications.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @patient_medications }
    end
  end

  # GET /patient_medications/new
  # GET /patient_medications/new.xml
  def new
    @patient_medications = PatientMedications.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @patient_medications }
    end
  end

  # GET /patient_medications/1/edit
  def edit
    @patient_medications = PatientMedications.find(params[:id])
  end

  # POST /patient_medications
  # POST /patient_medications.xml
  def create
    @patient_medications = PatientMedications.new(params[:patient_medications])

    respond_to do |format|
      if @patient_medications.save
        flash[:notice] = 'PatientMedications was successfully created.'
        format.html { redirect_to(@patient_medications) }
        format.xml  { render :xml => @patient_medications, :status => :created, :location => @patient_medications }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @patient_medications.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /patient_medications/1
  # PUT /patient_medications/1.xml
  def update
    @patient_medications = PatientMedications.find(params[:id])

    respond_to do |format|
      if @patient_medications.update_attributes(params[:patient_medications])
        flash[:notice] = 'PatientMedications was successfully updated.'
        format.html { redirect_to(@patient_medications) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @patient_medications.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /patient_medications/1
  # DELETE /patient_medications/1.xml
  def destroy
    @patient_medications = PatientMedications.find(params[:id])
    @patient_medications.destroy

    respond_to do |format|
      format.html { redirect_to(patient_medications_url) }
      format.xml  { head :ok }
    end
  end
end
