class ProcesosController < ApplicationController
  # GET /procesos
  # GET /procesos.json
  def index
    @procesos = Proceso.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @procesos }
    end
  end

  # GET /procesos/1
  # GET /procesos/1.json
  def show
    @proceso = Proceso.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @proceso }
    end
  end

  # GET /procesos/new
  # GET /procesos/new.json
  def new
    @proceso = Proceso.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @proceso }
    end
  end

  # GET /procesos/1/edit
  def edit
    @proceso = Proceso.find(params[:id])
  end

  # POST /procesos
  # POST /procesos.json
  def create
    @proceso = Proceso.new(params[:proceso])

    respond_to do |format|
      if @proceso.save
        format.html { redirect_to @proceso, notice: 'Proceso was successfully created.' }
        format.json { render json: @proceso, status: :created, location: @proceso }
      else
        format.html { render action: "new" }
        format.json { render json: @proceso.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /procesos/1
  # PUT /procesos/1.json
  def update
    @proceso = Proceso.find(params[:id])

    respond_to do |format|
      if @proceso.update_attributes(params[:proceso])
        format.html { redirect_to @proceso, notice: 'Proceso was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @proceso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /procesos/1
  # DELETE /procesos/1.json
  def destroy
    @proceso = Proceso.find(params[:id])
    @proceso.destroy

    respond_to do |format|
      format.html { redirect_to procesos_url }
      format.json { head :no_content }
    end
  end
end
