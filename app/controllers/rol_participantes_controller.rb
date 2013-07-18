class RolParticipantesController < ApplicationController
  # GET /rol_participantes
  # GET /rol_participantes.json
  def index
    @rol_participantes = RolParticipante.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rol_participantes }
    end
  end

  # GET /rol_participantes/1
  # GET /rol_participantes/1.json
  def show
    @rol_participante = RolParticipante.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rol_participante }
    end
  end

  # GET /rol_participantes/new
  # GET /rol_participantes/new.json
  def new
    @rol_participante = RolParticipante.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rol_participante }
    end
  end

  # GET /rol_participantes/1/edit
  def edit
    @rol_participante = RolParticipante.find(params[:id])
  end

  # POST /rol_participantes
  # POST /rol_participantes.json
  def create
    @rol_participante = RolParticipante.new(params[:rol_participante])

    respond_to do |format|
      if @rol_participante.save
        format.html { redirect_to @rol_participante, notice: 'Rol participante was successfully created.' }
        format.json { render json: @rol_participante, status: :created, location: @rol_participante }
      else
        format.html { render action: "new" }
        format.json { render json: @rol_participante.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rol_participantes/1
  # PUT /rol_participantes/1.json
  def update
    @rol_participante = RolParticipante.find(params[:id])

    respond_to do |format|
      if @rol_participante.update_attributes(params[:rol_participante])
        format.html { redirect_to @rol_participante, notice: 'Rol participante was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @rol_participante.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rol_participantes/1
  # DELETE /rol_participantes/1.json
  def destroy
    @rol_participante = RolParticipante.find(params[:id])
    @rol_participante.destroy

    respond_to do |format|
      format.html { redirect_to rol_participantes_url }
      format.json { head :no_content }
    end
  end
end
