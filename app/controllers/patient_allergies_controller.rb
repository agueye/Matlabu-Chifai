class PatientAllergiesController < ApplicationController
  before_filter :get_patient ,:except => [:find, :create]

  # GET /patient_allergies
  # GET /patient_allergies.xml
  def index
    
    @user = User.find_by_id(cookies[:userID])
    #get master key using cookieSalt and password 
    @password = EzCrypto::Key.decrypt_with_password @user.cookieSalt, "system salt",cookies[:encryptedPassword]
    @masterKey = EzCrypto::Key.decrypt_with_password @password, "system salt",@user.encryptedKey
    
  	if (params[:patient_id])
    	@patient_allergies = @patient.patient_allergies
      for @patient_allergy in @patient_allergies
        @patient_allergy.enter_password @masterKey
      end
      
    	@patient_allergies.sort! {|y, x| x.date_observed <=> y.date_observed}
    else
    	@patient_allergies = PatientAllergy.find(:all, :order => "date_observed DESC")
      for @patient_allergy in @patient_allergies
        @patient_allergy.enter_password @masterKey
      end
    end 
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @patient_allergies }
    end
  end

  def find
    @patient_allergies = PatientAllergy.find(:all, :conditions => ["allergy_id = ?", params[:search]])
    @patient_allergies.sort! {|y, x| x.date_observed <=> y.date_observed}
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @patient_allergies }
    end
  end

  # GET /patient_allergies/1
  # GET /patient_allergies/1.xml
  def show
    @patient_allergy = PatientAllergy.find(params[:id])
     @user = User.find_by_id(cookies[:userID])
    #get master key using cookieSalt and password 
    @password = EzCrypto::Key.decrypt_with_password @user.cookieSalt, "system salt",cookies[:encryptedPassword]
    @masterKey = EzCrypto::Key.decrypt_with_password @password, "system salt",@user.encryptedKey
    
    @patient_allergy.enter_password @masterKey
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @patient_allergy }
    end
  end

  # GET /patient_allergies/new
  # GET /patient_allergies/new.xml
  def new
    @patient_allergy = PatientAllergy.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @patient_allergy }
    end
  end

  # GET /patient_allergies/1/edit
  def edit
    @patient_allergy = PatientAllergy.find(params[:id])
  end

  # POST /patient_allergies
  # POST /patient_allergies.xml
  def create
	name = params["patient_allergy"].delete("name")
	patient = params["patient_allergy"].delete("patient_id")
  @patient_allergy = PatientAllergy.new(params[:patient_allergy])
	  
  @user = User.find_by_id(cookies[:userID])
  #get master key using cookieSalt and password 
  @password = EzCrypto::Key.decrypt_with_password @user.cookieSalt, "system salt",cookies[:encryptedPassword]
  @masterKey = EzCrypto::Key.decrypt_with_password @password, "system salt",@user.encryptedKey
  name = EzCrypto::Key.encrypt_with_password @masterKey, "onetwothree", name
  allergy = Allergy.find_by_name(name)
  @patient_allergy.allergy = allergy
  @patient_allergy.patient = Patient.find(patient);

  @patient_allergy.enter_password @masterKey
  
  
    respond_to do |format|
      if @patient_allergy.save
        flash[:notice] = "The patient's allergy was successfully created."
        
        APP_LOGGER_LOG.info "ALLERGY CREATED - for PATIENT ID " + @patient_allergy.patient[:medical_record_number].to_s + " by USER " + self.current_user[:login]
            
        format.html { redirect_to(patient_patient_allergies_path(@patient)) }
        format.xml  { render :xml => @patient_allergy, :status => :created, :location => @patient_allergy }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @patient_allergy.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /patient_allergies/1
  # PUT /patient_allergies/1.xml
  def update
    @patient_allergy = PatientAllergy.find(params[:id])

    respond_to do |format|
      if @patient_allergy.update_attributes(params[:patient_allergy])
        flash[:notice] = "The patient's allergy was successfully updated."
        get_patient_by_allergy
        APP_LOGGER_LOG.info "ALLERGY UPDATED - for PATIENT ID " + @patient[:medical_record_number].to_s + " by USER " + self.current_user[:login]
            
        format.html { redirect_to(patient_patient_allergies_path(@patient)) }
        format.xml  { render :xml => @patient_allergy }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @patient_allergy.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /patient_allergies/1
  # DELETE /patient_allergies/1.xml
  def destroy
    @patient_allergy = PatientAllergy.find(params[:id])
    @patient_allergy.destroy
    get_patient_by_allergy
    APP_LOGGER_LOG.info "ALLERGY DELETED - for PATIENT ID " + @patient[:medical_record_number].to_s + " by USER " + self.current_user[:login]
        
    respond_to do |format|
      format.html { redirect_to(patient_patient_allergies_path(@patient)) }
      format.xml  { head :ok }
    end
  end   

private
	def get_patient
		if (params[:patient_id])
			@patient = Patient.find(params[:patient_id])
		end
	end

  def get_patient_by_allergy
    #@user = User.find_by_id(cookies[:userID])
    #get master key using cookieSalt and password 
    #@password = EzCrypto::Key.decrypt_with_password @user.cookieSalt, "system salt",cookies[:encryptedPassword]
    #@masterKey = EzCrypto::Key.decrypt_with_password @password, "system salt",@user.encryptedKey
    @patient = Patient.find(@patient_allergy[:patient_id])
    #@patient.enter_password @masterKey
  end
end
