class PatientVaccinationsController < ApplicationController
  # GET /patient_vaccinations
  # GET /patient_vaccinations.xml
  def index
    @patient_vaccinations = PatientVaccination.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @patient_vaccinations }
    end
  end

  # GET /patient_vaccinations/1
  # GET /patient_vaccinations/1.xml
  def show
    @patient_vaccination = PatientVaccination.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @patient_vaccination }
    end
  end

  # GET /patient_vaccinations/new
  # GET /patient_vaccinations/new.xml
  def new
    @patient_vaccination = PatientVaccination.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @patient_vaccination }
    end
  end

  # GET /patient_vaccinations/1/edit
  def edit
    @patient_vaccination = PatientVaccination.find(params[:id])
  end

  # POST /patient_vaccinations
  # POST /patient_vaccinations.xml
  def create
    @patient_vaccination = PatientVaccination.new(params[:patient_vaccination])

    respond_to do |format|
      if @patient_vaccination.save
        flash[:notice] = 'PatientVaccination was successfully created.'
        format.html { redirect_to(@patient_vaccination) }
        format.xml  { render :xml => @patient_vaccination, :status => :created, :location => @patient_vaccination }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @patient_vaccination.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /patient_vaccinations/1
  # PUT /patient_vaccinations/1.xml
  def update
    @patient_vaccination = PatientVaccination.find(params[:id])

    respond_to do |format|
      if @patient_vaccination.update_attributes(params[:patient_vaccination])
        flash[:notice] = 'PatientVaccination was successfully updated.'
        format.html { redirect_to(@patient_vaccination) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @patient_vaccination.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /patient_vaccinations/1
  # DELETE /patient_vaccinations/1.xml
  def destroy
    @patient_vaccination = PatientVaccination.find(params[:id])
    @patient_vaccination.destroy

    respond_to do |format|
      format.html { redirect_to(patient_vaccinations_url) }
      format.xml  { head :ok }
    end
  end
end
