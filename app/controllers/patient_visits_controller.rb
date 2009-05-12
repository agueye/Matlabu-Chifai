class PatientVisitsController < ApplicationController
  before_filter :get_patient, :except => :find
  
  # GET /patient_visits
  # GET /patient_visits.xml
  def index
	@user = User.find_by_id(cookies[:userID])
	#get master key using cookieSalt and password 
	@password = EzCrypto::Key.decrypt_with_password @user.cookieSalt, "system salt",cookies[:encryptedPassword]
	@masterKey = EzCrypto::Key.decrypt_with_password @password, "system salt",@user.encryptedKey
  	if params[:patient_id]
		
  		@patient_visits = @patient.patient_visits
		for @patient_visit in @patient_visits
			if @patient_visit !=nil
				@patient_visit.enter_password @masterKey
			end
		end
    	@patient_visits.sort! {|y, x| x.visit_date <=> y.visit_date}
  	else
  		@patient_visits = PatientVisit.find(:all, :order => "visit_date DESC")
		for @patient_visit in @patient_visits
			if @patient_visit !=nil
				@patient_visit.enter_password @masterKey
			end
		end
  	end
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @patient_visits }
    end
  end

  def find
    @patient_visits = PatientVisit.find(:all, :conditions => ["condition_id = ?", params[:search]])
    @patient_visits.sort! {|y, x| x.visit_date <=> y.visit_date}
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @patient_visits }
    end
  end

  # GET /patient_visits/1
  # GET /patient_visits/1.xml
  def show
	@user = User.find_by_id(cookies[:userID])
	#get master key using cookieSalt and password 
	@password = EzCrypto::Key.decrypt_with_password @user.cookieSalt, "system salt",cookies[:encryptedPassword]
	@masterKey = EzCrypto::Key.decrypt_with_password @password, "system salt",@user.encryptedKey
    @patient_visit = PatientVisit.find(params[:id])
	@patient_visit.enter_password @masterKey
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
	@user = User.find_by_id(cookies[:userID])
	#get master key using cookieSalt and password 
	@password = EzCrypto::Key.decrypt_with_password @user.cookieSalt, "system salt",cookies[:encryptedPassword]
	@masterKey = EzCrypto::Key.decrypt_with_password @password, "system salt",@user.encryptedKey
	
	type = params["patient_visit"].delete("type")
	patient = params["patient_visit"].delete("patient_id")
	condition_n = params["patient_visit"].delete("condition")
	doctor_n = params["patient_visit"].delete("doctor")
    @patient_visit = PatientVisit.new(params[:patient_visit])
	
	
	type = EzCrypto::Key.encrypt_with_password @masterKey, "onetwothree", type
	condition_n = EzCrypto::Key.encrypt_with_password @masterKey, "onetwothree", condition_n
	doctor_n = EzCrypto::Key.encrypt_with_password @masterKey, "onetwothree", doctor_n	
	
	
    visit_t = VisitType.find_by_name(type)
	doctor = Doctor.find_by_name(doctor_n)
	condition = Condition.find_by_name(condition_n)
	@patient_visit.visit_type = visit_t
	@patient_visit.condition = condition
	@patient_visit.doctor = doctor
	@patient_visit.patient = Patient.find(patient)
	@patient_visit.enter_password @masterKey
	
    respond_to do |format|
      if @patient_visit.save
        flash[:notice] = "The patient's visit was successfully created."
        
        APP_LOGGER_LOG.info "VISIT CREATED - for PATIENT ID " + @patient_visit.patient[:medical_record_number].to_s + " by USER " + self.current_user[:login]
        
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
	@user = User.find_by_id(cookies[:userID])
	#get master key using cookieSalt and password 
	@password = EzCrypto::Key.decrypt_with_password @user.cookieSalt, "system salt",cookies[:encryptedPassword]
	@masterKey = EzCrypto::Key.decrypt_with_password @password, "system salt",@user.encryptedKey
	
    @patient_visit = PatientVisit.find(params[:id])
	@patient_visit.enter_password @masterKey

    respond_to do |format|
      if @patient_visit.update_attributes(params[:patient_visit])
        flash[:notice] = "The patient's visit was successfully updated."
        get_patient_by_visit
        APP_LOGGER_LOG.info "VISIT UPDATED - for PATIENT ID " + @patient[:medical_record_number].to_s + " by USER " + self.current_user[:login]
        
        format.html { redirect_to(patient_patient_visit_path(@patient, @patient_visit)) }
        format.xml  { render :xml => @patient_visit }
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
    get_patient_by_visit
    APP_LOGGER_LOG.info "VISIT DELETED - for PATIENT ID " + @patient[:medical_record_number].to_s + " by USER " + self.current_user[:login]
    
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

  def get_patient_by_visit
    #@user = User.find_by_id(cookies[:userID])
    #get master key using cookieSalt and password 
    #@password = EzCrypto::Key.decrypt_with_password @user.cookieSalt, "system salt",cookies[:encryptedPassword]
    #@masterKey = EzCrypto::Key.decrypt_with_password @password, "system salt",@user.encryptedKey
    @patient = Patient.find(@patient_visit[:patient_id])
    #@patient.enter_password @masterKey
  end
end
