class VisitTypesController < ApplicationController
  # GET /visit_types
  # GET /visit_types.json
  def index
    @visit_types = VisitType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @visit_types }
    end
  end

  # GET /visit_types/1
  # GET /visit_types/1.json
  def show
    @visit_type = VisitType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @visit_type }
    end
  end

  # GET /visit_types/new
  # GET /visit_types/new.json
  def new
    @visit_type = VisitType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @visit_type }
    end
  end

  # GET /visit_types/1/edit
  def edit
    @visit_type = VisitType.find(params[:id])
  end

  # POST /visit_types
  # POST /visit_types.json
  def create
    @visit_type = VisitType.new(params[:visit_type])

    respond_to do |format|
      if @visit_type.save
        format.html { redirect_to @visit_type, :notice => 'Visit type was successfully created.' }
        format.json { render :json => @visit_type, :status => :created, :location => @visit_type }
      else
        format.html { render :action => "new" }
        format.json { render :json => @visit_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /visit_types/1
  # PUT /visit_types/1.json
  def update
    @visit_type = VisitType.find(params[:id])

    respond_to do |format|
      if @visit_type.update_attributes(params[:visit_type])
        format.html { redirect_to @visit_type, :notice => 'Visit type was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @visit_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /visit_types/1
  # DELETE /visit_types/1.json
  def destroy
    @visit_type = VisitType.find(params[:id])
    @visit_type.destroy

    respond_to do |format|
      format.html { redirect_to visit_types_url }
      format.json { head :ok }
    end
  end
end
