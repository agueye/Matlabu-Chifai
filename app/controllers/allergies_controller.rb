class AllergiesController < ApplicationController
  # GET /allergies
  # GET /allergies.xml
  def index
    @allergies = Allergy.find(:all)

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

    respond_to do |format|
      if @allergy.save
        flash[:notice] = 'Allergy was successfully created.'
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
        format.html { redirect_to(@allergy) }
        format.xml  { head :ok }
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

    respond_to do |format|
      format.html { redirect_to(allergies_url) }
      format.xml  { head :ok }
    end
  end
end
