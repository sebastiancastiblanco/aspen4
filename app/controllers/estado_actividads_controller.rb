class EstadoActividadsController < ApplicationController
  # GET /estado_actividads
  # GET /estado_actividads.json
  def index
    @estado_actividads = EstadoActividad.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @estado_actividads }
    end
  end

  # GET /estado_actividads/1
  # GET /estado_actividads/1.json
  def show
    @estado_actividad = EstadoActividad.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @estado_actividad }
    end
  end

  # GET /estado_actividads/new
  # GET /estado_actividads/new.json
  def new
    @estado_actividad = EstadoActividad.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @estado_actividad }
    end
  end

  # GET /estado_actividads/1/edit
  def edit
    @estado_actividad = EstadoActividad.find(params[:id])
  end

  # POST /estado_actividads
  # POST /estado_actividads.json
  def create
    @estado_actividad = EstadoActividad.new(params[:estado_actividad])

    respond_to do |format|
      if @estado_actividad.save
        format.html { redirect_to @estado_actividad, notice: 'Estado actividad was successfully created.' }
        format.json { render json: @estado_actividad, status: :created, location: @estado_actividad }
      else
        format.html { render action: "new" }
        format.json { render json: @estado_actividad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /estado_actividads/1
  # PUT /estado_actividads/1.json
  def update
    @estado_actividad = EstadoActividad.find(params[:id])

    respond_to do |format|
      if @estado_actividad.update_attributes(params[:estado_actividad])
        format.html { redirect_to @estado_actividad, notice: 'Estado actividad was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @estado_actividad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estado_actividads/1
  # DELETE /estado_actividads/1.json
  def destroy
    @estado_actividad = EstadoActividad.find(params[:id])
    @estado_actividad.destroy

    respond_to do |format|
      format.html { redirect_to estado_actividads_url }
      format.json { head :no_content }
    end
  end
end
