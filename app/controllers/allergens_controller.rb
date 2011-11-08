class AllergensController < ApplicationController
  # GET /allergens
  # GET /allergens.json
  def index
    @allergens = Allergen.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @allergens }
    end
  end

  # GET /allergens/1
  # GET /allergens/1.json
  def show
    @allergen = Allergen.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @allergen }
    end
  end

  # GET /allergens/new
  # GET /allergens/new.json
  def new
    @allergen = Allergen.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @allergen }
    end
  end

  # GET /allergens/1/edit
  def edit
    @allergen = Allergen.find(params[:id])
  end

  # POST /allergens
  # POST /allergens.json
  def create
    @allergen = Allergen.new(params[:allergen])

    respond_to do |format|
      if @allergen.save
        format.html { redirect_to @allergen, notice: 'Allergen was successfully created.' }
        format.json { render json: @allergen, status: :created, location: @allergen }
      else
        format.html { render action: "new" }
        format.json { render json: @allergen.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /allergens/1
  # PUT /allergens/1.json
  def update
    @allergen = Allergen.find(params[:id])

    respond_to do |format|
      if @allergen.update_attributes(params[:allergen])
        format.html { redirect_to @allergen, notice: 'Allergen was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @allergen.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /allergens/1
  # DELETE /allergens/1.json
  def destroy
    @allergen = Allergen.find(params[:id])
    @allergen.destroy

    respond_to do |format|
      format.html { redirect_to allergens_url }
      format.json { head :ok }
    end
  end
end
