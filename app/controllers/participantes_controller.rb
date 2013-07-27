class ParticipantesController < ApplicationController
  # GET /participantes
  # GET /participantes.json
  def index
    @proceso = Proceso.find(params[:id])
    @participantes = @proceso.participantes
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @participantes }
    end
  end

  # GET /participantes/1
  # GET /participantes/1.json
  def show
    @participante = Participante.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @participante }
    end
  end

  # GET /participantes/new
  # GET /participantes/new.json
  def new
    @participante = Participante.new
    @rol_participantes = RolParticipante.all
    @proceso = Proceso.find(params[:id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @participante }
    end
  end

  # GET /participantes/1/edit
  def edit
    @participante = Participante.find(params[:participante_id])
    @proceso = Proceso.find(params[:proceso_id])
    @rol_participantes = RolParticipante.all

  end

  # POST /participantes
  # POST /participantes.json
  def create
    @participante = Participante.new(params[:participante])
    @proceso = Proceso.find(params[:proceso_id])

    respond_to do |format|
      if @participante.save
         #Crear la relacion entre particpante creado y el proceso
         @participante.proceso_participantes.create(:participante_id => Participante.last.id,:proceso_id => @proceso.id)

        format.html { redirect_to @proceso, notice: 'Participante was successfully created.' }
        format.json { render json: @participante, status: :created, location: @participante }
      else
        format.html { render action: "new" }
        format.json { render json: @participante.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /participantes/1
  # PUT /participantes/1.json
  def update
    @participante = Participante.find(params[:id])
    @proceso = Proceso.find(params[:proceso_id])
    
    respond_to do |format|
      if @participante.update_attributes(params[:participante])
        format.html { redirect_to @proceso, notice: 'Participante was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @participante.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /participantes/1
  # DELETE /participantes/1.json
  def destroy
    @participante = Participante.find(params[:id])
    @participante.destroy

    respond_to do |format|
      format.html { redirect_to participantes_url }
      format.json { head :no_content }
    end
  end
end
