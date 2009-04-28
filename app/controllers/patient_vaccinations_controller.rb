class PatientVaccinationsController < ApplicationController

  before_filter :get_patient, :except => :find
  # GET /patient_vaccinations
  # GET /patient_vaccinations.xml
  def index
  	if params[:patient_id]
    	@patient_vaccinations = @patient.patient_vaccinations
    	@patient_vaccinations.sort! {|y, x| x.date_admined <=> y.date_admined}
   	else
   		@patient_vaccinations = PatientVaccination.find(:all, :order => "date_admined DESC")
   	end
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @patient_vaccinations }
    end
  end
  
  def find
    @patient_vaccinations = PatientVaccination.find(:all, :conditions => ["vaccination_id = ?", params[:search]], 
    						:order => "date_admined DESC")
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
    @patient_vaccination.patient = @patient
    
    APP_LOGGER_LOG.info "VACCINATION CREATED - for PATIENT ID " + @patient_vaccination[:patient_id].to_s + " by USER " + self.current_user[:login]
    
    respond_to do |format|
      if @patient_vaccination.save
        flash[:notice] = "The patient's vaccination was successfully created."
        format.html { redirect_to(patient_patient_vaccinations_path(@patient)) }
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
        flash[:notice] = "The patient's vaccination was successfully updated."
        
        APP_LOGGER_LOG.info "VACCINATION UPDATED - for PATIENT ID " + @patient_vaccination[:patient_id].to_s + " by USER " + self.current_user[:login]
        
        format.html { redirect_to(patient_patient_vaccinations_path(@patient)) }
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

    APP_LOGGER_LOG.info "VACCINATION DELETED - for PATIENT ID " + @patient_vaccination[:patient_id].to_s + " by USER " + self.current_user[:login]
    
    respond_to do |format|
      format.html { redirect_to(patient_patient_vaccinations_path(@patient)) }
      format.xml  { head :ok }
    end
  end
  
  private
  
  def get_patient
    if params[:patient_id]
      @patient = Patient.find(params[:patient_id])
    end
  end
end
