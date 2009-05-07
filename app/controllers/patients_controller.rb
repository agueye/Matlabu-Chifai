class PatientsController < ApplicationController
  # GET /patients
  # GET /patients.xml
  def index
    @patients = Patient.find(:all)
	#get user's id from cookie and look up user in the db
    @user = User.find_by_id(cookies[:userID])

	#get master key using cookieSalt and password 
    @password = EzCrypto::Key.decrypt_with_password @user.cookieSalt, "system salt",cookies[:encryptedPassword]
	@masterKey = EzCrypto::Key.decrypt_with_password @password, "system salt",@user.encryptedKey
	for temp in @patients
		temp.enter_password @masterKey
	end
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
#create a new patient object from information submitted through new patient form
    @patientNew = Patient.new(params[:patient])

    #get user's id from cookie and look up user in the db
    @user = User.find_by_id(cookies[:userID])

	#get master key using cookieSalt and password 
    @password = EzCrypto::Key.decrypt_with_password @user.cookieSalt, "system salt",cookies[:encryptedPassword]
	@masterKey = EzCrypto::Key.decrypt_with_password @password, "system salt",@user.encryptedKey

    #create a new patient object where encrypted information will be put in
    @patient = Patient.new
	
	@patient.arrival_date = @patientNew.arrival_date
	@patient.date_of_birth = @patientNew.date_of_birth
	@patient.first_name = @patientNew.first_name
	@patient.middle_name = @patientNew.middle_name
	@patient.last_name = @patientNew.last_name
	
    #set the key to encrypt the information in this new patient object
    @patient.enter_password @masterKey
       
     #take information from unencrypted object @patientNew and put it into encrypted object @patient
   	

    @patient.medical_record_number = @patientNew.medical_record_number
	@patient.gender = @patientNew.gender
	@patient.address = @patientNew.address
	@patient.city = @patientNew.city
	@patient.state = @patientNew.state
	@patient.zip = @patientNew.zip
	@patient.father_first_name = @patientNew.father_first_name
	@patient.father_last_name = @patientNew.father_last_name
	@patient.mother_last_name = @patientNew.mother_last_name
	@patient.mother_first_name = @patientNew.mother_first_name
	@patient.telephone = @patientNew.telephone
	@patient.emergency_contact_name = @patientNew.emergency_contact_name
	@patient.emergency_contact_relationship = @patientNew.emergency_contact_relationship
	@patient.emergency_contact_number = @patientNew.emergency_contact_number
	@patient.notes = @patientNew.notes
	
	
	#@patient.medical_record_number=@masterKey.encrypt(@patient.medical_record_number)
	#@patient.arrival_date=@masterKey.encrypt(@patient.arrival_date.to_s)
	#@patient.date_of_birth=@masterKey.encrypt(@patient.date_of_birth.to_s)
	#@decrypted=@key.decrypt(@encrypted)
    #assert "clear text", @decrypted


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
	
	
	#get user's id from cookie and look up user in the db
    @user = User.find_by_id(cookies[:userID])

	#get master key using cookieSalt and password 
    @password = EzCrypto::Key.decrypt_with_password @user.cookieSalt, "system salt",cookies[:encryptedPassword]
	@masterKey = EzCrypto::Key.decrypt_with_password @password, "system salt",@user.encryptedKey
    #set the key to encrypt the information in this new patient object
    @patient.enter_password @masterKey


    respond_to do |format|
      if @patient.update_attributes(params[:patient])
        flash[:notice] = 'Patient was successfully updated.'
        
        APP_LOGGER_LOG.info "PATIENT UPDATED - for PATIENT ID " + @patient[:medical_record_number] + " by USER " + self.current_user[:login]
        
        format.html { redirect_to(@patient) }
        format.xml  { render :xml => @patient }
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
