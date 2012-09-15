class SetupsController < ApplicationController
  # GET /setups
  # GET /setups.json
  def index
    @setups = Setup.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @setups }
    end
  end

  # GET /setups/1
  # GET /setups/1.json
  def show
    @setup = Setup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @setup }
    end
  end

  # GET /setups/new
  # GET /setups/new.json
  def new
    @setup = Setup.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @setup }
    end
  end

  # GET /setups/1/edit
  def edit
    @setup = Setup.find(params[:id])
  end

  # POST /setups
  # POST /setups.json
  def create
    @setup = Setup.new(params[:setup])

    respond_to do |format|
      if @setup.save
        format.html { redirect_to @setup, notice: 'Setup was successfully created.' }
        format.json { render json: @setup, status: :created, location: @setup }
      else
        format.html { render action: "new" }
        format.json { render json: @setup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /setups/1
  # PUT /setups/1.json
  def update
    @setup = Setup.find(params[:id])

    respond_to do |format|
      if @setup.update_attributes(params[:setup])
        format.html { redirect_to @setup, notice: 'Setup was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @setup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /setups/1
  # DELETE /setups/1.json
  def destroy
    @setup = Setup.find(params[:id])
    @setup.destroy

    respond_to do |format|
      format.html { redirect_to setups_url }
      format.json { head :no_content }
    end
  end
end
