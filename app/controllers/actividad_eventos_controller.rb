class ActividadEventosController < ApplicationController
  # GET /actividad_eventos
  # GET /actividad_eventos.json
  def index
    @actividad_eventos = ActividadEvento.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @actividad_eventos }
    end
  end

  # GET /actividad_eventos/1
  # GET /actividad_eventos/1.json
  def show
    @actividad_evento = ActividadEvento.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @actividad_evento }
    end
  end

  # GET /actividad_eventos/new
  # GET /actividad_eventos/new.json
  def new
    @actividad_evento = ActividadEvento.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @actividad_evento }
    end
  end

  # GET /actividad_eventos/1/edit
  def edit
    @actividad_evento = ActividadEvento.find(params[:id])
  end

  # POST /actividad_eventos
  # POST /actividad_eventos.json
  def create
    @actividad_evento = ActividadEvento.new(params[:actividad_evento])

    respond_to do |format|
      if @actividad_evento.save
        format.html { redirect_to @actividad_evento, notice: 'Actividad evento was successfully created.' }
        format.json { render json: @actividad_evento, status: :created, location: @actividad_evento }
      else
        format.html { render action: "new" }
        format.json { render json: @actividad_evento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /actividad_eventos/1
  # PUT /actividad_eventos/1.json
  def update
    @actividad_evento = ActividadEvento.find(params[:id])

    respond_to do |format|
      if @actividad_evento.update_attributes(params[:actividad_evento])
        format.html { redirect_to @actividad_evento, notice: 'Actividad evento was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @actividad_evento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /actividad_eventos/1
  # DELETE /actividad_eventos/1.json
  def destroy
    @actividad_evento = ActividadEvento.find(params[:id])
    @actividad_evento.destroy

    respond_to do |format|
      format.html { redirect_to actividad_eventos_url }
      format.json { head :no_content }
    end
  end
end
