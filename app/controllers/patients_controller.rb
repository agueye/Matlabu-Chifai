class PatientsController < ApplicationController
  # GET /patients
  # GET /patients.xml
  def index
    @patients = Patient.find(:all)
    @patients.sort! {|x,y| x.last_name <=> y.last_name}

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @patients }
    end
  end
  
  def find
    @patients = Patient.find(:all, :conditions => ["id = ?", params[:search]]) 
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @patients }
    end
  end

  # GET /patients/1
  # GET /patients/1.xml
  def show
    @patient = Patient.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @patient }
    end
  end

  # GET /patients/new
  # GET /patients/new.xml
  def new
    @patient = Patient.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @patient }
    end
  end

  # GET /patients/1/edit
  def edit
    @patient = Patient.find(params[:id])
  end

  # POST /patients
  # POST /patients.xml
  def create
    @patient = Patient.new(params[:patient])

    respond_to do |format|
      if @patient.save
        flash[:notice] = 'Patient was successfully created.'
        
        APP_LOGGER_LOG.info "PATIENT CREATED - for PATIENT ID " + @patient[:medical_record_number] + " by USER " + self.current_user[:login]
        
        format.html { redirect_to(@patient) }
        format.xml  { render :xml => @patient, :status => :created, :location => @patient }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @patient.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /patients/1
  # PUT /patients/1.xml
  def update
    @patient = Patient.find(params[:id])

    respond_to do |format|
      if @patient.update_attributes(params[:patient])
        flash[:notice] = 'Patient was successfully updated.'
        
        APP_LOGGER_LOG.info "PATIENT UPDATED - for PATIENT ID " + @patient[:medical_record_number] + " by USER " + self.current_user[:login]
        
        format.html { redirect_to(@patient) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @patient.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.xml
  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy
    
    APP_LOGGER_LOG.info "PATIENT DELETED - for PATIENT ID " + @patient[:medical_record_number] + " by USER " + self.current_user[:login]
    
    respond_to do |format|
      format.html { redirect_to(patients_url) }
      format.xml  { head :ok }
    end
  end
end
