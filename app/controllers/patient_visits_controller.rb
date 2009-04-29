class PatientVisitsController < ApplicationController
  before_filter :get_patient, :except => :find
  
  # GET /patient_visits
  # GET /patient_visits.xml
  def index
  	if params[:patient_id]
  		@patient_visits = @patient.patient_visits
    	@patient_visits.sort! {|y, x| x.visit_date <=> y.visit_date}
  	else
  		@patient_visits = PatientVisit.find(:all, :order => "visit_date DESC")
  	end
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @patient_visits }
    end
  end

  def find
    @patient_visits = PatientVisit.find(:all, :conditions => ["condition_id = ?", params[:search]], 
    						:order => "visit_date DESC")
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @patient_visits }
    end
  end

  # GET /patient_visits/1
  # GET /patient_visits/1.xml
  def show
    @patient_visit = PatientVisit.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @patient_visit }
    end
  end

  # GET /patient_visits/new
  # GET /patient_visits/new.xml
  def new
    @patient_visit = PatientVisit.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @patient_visit }
    end
  end

  # GET /patient_visits/1/edit
  def edit
    @patient_visit = PatientVisit.find(params[:id])
    @patient_conditions = @patient_visit.patient_conditions
  end

  # POST /patient_visits
  # POST /patient_visits.xml
  def create
    @patient_visit = PatientVisit.new(params[:patient_visit])
    @patient_visit.patient = @patient

    respond_to do |format|
      if @patient_visit.save
        flash[:notice] = "The patient's visit was successfully created."
        
        APP_LOGGER_LOG.info "VISIT CREATED - for PATIENT ID " + @patient_visit[:patient_id].to_s + " by USER " + self.current_user[:login]
        
        format.html { redirect_to(patient_patient_visit_path(@patient, @patient_visit)) }
        format.xml  { render :xml => @patient_visit, :status => :created, :location => @patient_visit }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @patient_visit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /patient_visits/1
  # PUT /patient_visits/1.xml
  def update
    @patient_visit = PatientVisit.find(params[:id])

    respond_to do |format|
      if @patient_visit.update_attributes(params[:patient_visit])
        flash[:notice] = "The patient's visit was successfully updated."
        
        APP_LOGGER_LOG.info "VISIT UPDATED - for PATIENT ID " + @patient_visit[:patient_id].to_s + " by USER " + self.current_user[:login]
        
        format.html { redirect_to(patient_patient_visit_path(@patient, @patient_visit)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @patient_visit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /patient_visits/1
  # DELETE /patient_visits/1.xml
  def destroy
    @patient_visit = PatientVisit.find(params[:id])
    @patient_visit.destroy
    
    APP_LOGGER_LOG.info "VISIT DELETED - for PATIENT ID " + @patient_visit[:patient_id].to_s + " by USER " + self.current_user[:login]
    
    respond_to do |format|
      format.html { redirect_to(patient_patient_visits_path(@patient)) }
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
