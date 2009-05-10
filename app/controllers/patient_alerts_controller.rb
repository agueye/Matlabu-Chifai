class PatientAlertsController < ApplicationController
  before_filter :get_patient
  
  # GET /patient_alerts
  # GET /patient_alerts.xml
  def index
  		@user = User.find_by_id(cookies[:userID])
		#get master key using cookieSalt and password 
		@password = EzCrypto::Key.decrypt_with_password @user.cookieSalt, "system salt",cookies[:encryptedPassword]
		@masterKey = EzCrypto::Key.decrypt_with_password @password, "system salt",@user.encryptedKey
		
		#@patient_alerts = PatientAlert.find(:all)
		#for @patient_alert in @patient_alerts
			#@patient_alert.enter_password @masterKey
		#end
    if params[:patient_id]
      @patient_alerts = @patient.patient_alerts
      for @patient_alert in @patient_alerts
        @patient_alert.enter_password @masterKey
      end
      
    	@patient_alerts.sort! {|x, y| x.alert_date <=> y.alert_date} 
    else
    	@patient_alerts = PatientAlert.find(:all, :order => "alert_date")
      for @patient_alert in @patient_alerts
        @patient_alert.enter_password @masterKey
      end
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @patient_alerts }
    end
  end

  # GET /patient_alerts/1
  # GET /patient_alerts/1.xml
  def show
    @patient_alert = PatientAlert.find(params[:id])
	
	@user = User.find_by_id(cookies[:userID])
	#get master key using cookieSalt and password 
    @password = EzCrypto::Key.decrypt_with_password @user.cookieSalt, "system salt",cookies[:encryptedPassword]
	@masterKey = EzCrypto::Key.decrypt_with_password @password, "system salt",@user.encryptedKey
	
	@patient_alert.enter_password @masterKey
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @patient_alert }
    end
  end

  # GET /patient_alerts/new
  # GET /patient_alerts/new.xml
  def new
    @patient_alert = PatientAlert.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @patient_alert }
    end
  end

  # GET /patient_alerts/1/edit
  def edit
    @patient_alert = PatientAlert.find(params[:id])
  end

  # POST /patient_alerts
  # POST /patient_alerts.xml
  def create
      
	@user = User.find_by_id(cookies[:userID])
	#get master key using cookieSalt and password 
    @password = EzCrypto::Key.decrypt_with_password @user.cookieSalt, "system salt",cookies[:encryptedPassword]
	@masterKey = EzCrypto::Key.decrypt_with_password @password, "system salt",@user.encryptedKey
	
	@patient_alert = PatientAlert.new(params[:patient_alert])
	@patient_alert.enter_password @masterKey
	
	 @patient_alert.patient = @patient
	
	
    respond_to do |format|
      if @patient_alert.save
        flash[:notice] = 'PatientAlert was successfully created.'
        APP_LOGGER_LOG.info "ALERT CREATED - for PATIENT ID " + @patient[:medical_record_number].to_s + " by USER " + self.current_user[:login]
        
        format.html { redirect_to(@patient_alert) }
        format.xml  { render :xml => @patient_alert, :status => :created, :location => @patient_alert }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @patient_alert.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /patient_alerts/1
  # PUT /patient_alerts/1.xml
  def update
    @patient_alert = PatientAlert.find(params[:id])
	
    respond_to do |format|
      if @patient_alert.update_attributes(params[:patient_alert])
        get_patient_by_alert
        APP_LOGGER_LOG.info "ALERT UPDATED - for PATIENT ID " + @patient[:medical_record_number].to_s + " by USER " + self.current_user[:login]
        
        flash[:notice] = 'PatientAlert was successfully updated.'
        format.html { redirect_to(@patient_alert) }
        format.xml  { render :xml => @patient_alert }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @patient_alert.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /patient_alerts/1
  # DELETE /patient_alerts/1.xml
  def destroy
    @patient_alert = PatientAlert.find(params[:id])
    @patient_alert.destroy
    get_patient_by_alert
    APP_LOGGER_LOG.info "ALERT DELETED - for PATIENT ID " + @patient[:medical_record_number].to_s + " by USER " + self.current_user[:login]
    
    respond_to do |format|
      format.html { redirect_to(patient_alerts_url) }
      format.xml  { head :ok }
    end
  end

private
	def get_patient
		if (params[:patient_id])
			@user = User.find_by_id(cookies[:userID])
			#get master key using cookieSalt and password 
			@password = EzCrypto::Key.decrypt_with_password @user.cookieSalt, "system salt",cookies[:encryptedPassword]
			@masterKey = EzCrypto::Key.decrypt_with_password @password, "system salt",@user.encryptedKey
			@patient = Patient.find(params[:patient_id])
			@patient.enter_password @masterKey
		end
  end 

  def get_patient_by_alert
    @user = User.find_by_id(cookies[:userID])
    #get master key using cookieSalt and password 
    @password = EzCrypto::Key.decrypt_with_password @user.cookieSalt, "system salt",cookies[:encryptedPassword]
    @masterKey = EzCrypto::Key.decrypt_with_password @password, "system salt",@user.encryptedKey
    @patient = Patient.find(@patient_alert[:patient_id])
    @patient.enter_password @masterKey
  end
end
