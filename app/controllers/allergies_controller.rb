class AllergiesController < ApplicationController
  # GET /allergies
  # GET /allergies.xml
  def index
    @allergies = Allergy.find(:all)
    @allergies.sort! {|x, y| x.name <=> y.name}

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @allergies }
    end
  end

  # GET /allergies/1
  # GET /allergies/1.xml
  def show
    @allergy = Allergy.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @allergy }
    end
  end

  # GET /allergies/new
  # GET /allergies/new.xml
  def new
    @allergy = Allergy.new		

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @allergy }
    end
  end

  # GET /allergies/1/edit
  def edit
    @allergy = Allergy.find(params[:id])
  end

  # POST /allergies
  # POST /allergies.xml
  def create
	@allergy = Allergy.new(params[:allergy])
	#@allergy = Allergy.new
	#@user = User.find_by_id(cookies[:userID])
	#get master key using cookieSalt and password 
    #@password = EzCrypto::Key.decrypt_with_password @user.cookieSalt, "system salt",cookies[:encryptedPassword]
	#@masterKey = EzCrypto::Key.decrypt_with_password @password, "system salt",@user.encryptedKey
	#@allergy.enter_password @masterKey
	#@allergy.name = @allergyNew.name
	#@allergy.notes = @allergyNew.notes
	
	
	
    respond_to do |format|
      if @allergy.save
        flash[:notice] = 'Allergy was successfully created.'
        
        APP_LOGGER_LOG.info "ALLERGY CREATED - " + @allergy[:name] + " by USER " + self.current_user[:login]
        
        format.html { redirect_to(@allergy) }
        format.xml  { render :xml => @allergy, :status => :created, :location => @allergy }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @allergy.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /allergies/1
  # PUT /allergies/1.xml
  def update
    @allergy = Allergy.find(params[:id])

    respond_to do |format|
      if @allergy.update_attributes(params[:allergy])
        flash[:notice] = 'Allergy was successfully updated.'
        
        APP_LOGGER_LOG.info "ALLERGY UPDATED - " + @allergy[:name] + " by USER " + self.current_user[:login]
        
        format.html { redirect_to(@allergy) }
        format.xml  { render :xml => @allergy }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @allergy.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /allergies/1
  # DELETE /allergies/1.xml
  def destroy
    @allergy = Allergy.find(params[:id])
    @allergy.destroy
    
    APP_LOGGER_LOG.info "ALLERGY DELETED - " + @allergy[:name] + " by USER " + self.current_user[:login]

    respond_to do |format|
      format.html { redirect_to(allergies_url) }
      format.xml  { head :ok }
    end
  end
end
