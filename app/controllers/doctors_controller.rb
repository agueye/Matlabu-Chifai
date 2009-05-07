class DoctorsController < ApplicationController
  # GET /doctors
  # GET /doctors.xml
  def index
    @doctors = Doctor.find(:all)
    @doctors.sort! {|x, y| x.last_name <=> y.last_name}

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @doctors }
    end
  end

  # GET /doctors/1
  # GET /doctors/1.xml
  def show
    @doctor = Doctor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @doctor }
    end
  end

  # GET /doctors/new
  # GET /doctors/new.xml
  def new
    @doctor = Doctor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @doctor }
    end
  end

  # GET /doctors/1/edit
  def edit
    @doctor = Doctor.find(params[:id])
  end

  # POST /doctors
  # POST /doctors.xml
  def create
    @doctor = Doctor.new(params[:doctor])
    
    APP_LOGGER_LOG.info "DOCTOR CREATED - " + @doctor[:name] + "by USER " + self.current_user[:login]
    
    respond_to do |format|
      if @doctor.save
        flash[:notice] = 'Doctor was successfully created.'
        format.html { redirect_to(@doctor) }
        format.xml  { render :xml => @doctor, :status => :created, :location => @doctor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @doctor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /doctors/1
  # PUT /doctors/1.xml
  def update
    @doctor = Doctor.find(params[:id])

    respond_to do |format|
      if @doctor.update_attributes(params[:doctor])
        
        APP_LOGGER_LOG.info "DOCTOR UPDATED - " + @doctor[:name] + "by USER " + self.current_user[:login]
            
        flash[:notice] = 'Doctor was successfully updated.'
        format.html { redirect_to(@doctor) }
        format.xml  { render :xml => @doctor }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @doctor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /doctors/1
  # DELETE /doctors/1.xml
  def destroy
    @doctor = Doctor.find(params[:id])
    @doctor.destroy
    
    APP_LOGGER_LOG.info "DOCTOR DELETED - " + @doctor[:name] + "by USER " + self.current_user[:login]
        
    respond_to do |format|
      format.html { redirect_to(doctors_url) }
      format.xml  { head :ok }
    end
  end
end
