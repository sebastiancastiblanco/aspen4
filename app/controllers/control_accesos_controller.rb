class ControlAccesosController < ApplicationController
  # GET /control_accesos
  # GET /control_accesos.json
  def index
    @control_accesos = ControlAcceso.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @control_accesos }
    end
  end

  # GET /control_accesos/1
  # GET /control_accesos/1.json
  def show
    @control_acceso = ControlAcceso.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @control_acceso }
    end
  end

  # GET /control_accesos/new
  # GET /control_accesos/new.json
  def new
    @control_acceso = ControlAcceso.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @control_acceso }
    end
  end

  # GET /control_accesos/1/edit
  def edit
    @control_acceso = ControlAcceso.find(params[:id])
  end

  # POST /control_accesos
  # POST /control_accesos.json
  def create
    @control_acceso = ControlAcceso.new(params[:control_acceso])

    respond_to do |format|
      if @control_acceso.save
        format.html { redirect_to @control_acceso, notice: 'Control acceso was successfully created.' }
        format.json { render json: @control_acceso, status: :created, location: @control_acceso }
      else
        format.html { render action: "new" }
        format.json { render json: @control_acceso.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /control_accesos/1
  # PUT /control_accesos/1.json
  def update
    @control_acceso = ControlAcceso.find(params[:id])

    respond_to do |format|
      if @control_acceso.update_attributes(params[:control_acceso])
        format.html { redirect_to @control_acceso, notice: 'Control acceso was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @control_acceso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /control_accesos/1
  # DELETE /control_accesos/1.json
  def destroy
    @control_acceso = ControlAcceso.find(params[:id])
    @control_acceso.destroy

    respond_to do |format|
      format.html { redirect_to control_accesos_url }
      format.json { head :no_content }
    end
  end
end
