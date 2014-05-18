class ParticipantesController < ApplicationController
  # GET /participantes
  # GET /participantes.json

  # debe esta logeado para iniciar a las paginas
  before_filter :authenticate_abogado!

  def index
    @proceso = Proceso.find(params[:proceso_id])
    @participantes = @proceso.participantes.activos  #scope recuperar participantes activos

    @participantesRender = (params[:nuevoItem])
    
    @logParticipantes = Log.where(usuario_id: current_abogado.id, proceso_id: @proceso.id, mensaje_id: 2 ).order('created_at DESC')

    if params[:participante_id]
       @participante = Participante.find(params[:participante_id])
    else
       @participante = Participante.new
    end
    @rol_participantes = RolParticipante.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @participantes }
      format.js
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
    @proceso = Proceso.find(params[:proceso_id])

    respond_to do |format|
      format.html # show.html.erb
      format.js
    end
  end

  # GET /participantes/1/edit
  def edit
    @participante = Participante.find(params[:id])
    @proceso = Proceso.find(params[:proceso_id])
    @participantes = @proceso.participantes
    @rol_participantes = RolParticipante.all
    @participantesRender = (params[:nuevoItem])
    
     respond_to do |format|
        format.html # show.html.erb
        format.js
    end
  end

  # POST /participantes
  # POST /participantes.json
  def create
    @participante = Participante.new(params[:participante])
    @proceso = Proceso.find(params[:proceso_id])
    @participante.proceso_id = @proceso.id
    @participante.activo = true

    @rol_participantes = RolParticipante.all
    @displaycamposOpcionalesParticipante = params[:displayOpcionales]

    respond_to do |format|
      if @participante.save
          #Traza de log
          Log.create(:usuario => current_abogado.email,:proceso => @proceso.tipo_proceso.tipo+' - '+@proceso.titulo ,:abogado_id => current_abogado.id ,:proceso => @proceso, :participante_id => @participante.id, :mensaje_id => 2 ,:mensaje=> current_abogado.email.to_s+', Creo el participante: '+@participante.nombre+' '+@participante.apellido)
          
          format.html { redirect_to @participante, notice: 'El participante fue creado correctamente.'}
          format.json { render json: @participante, status: :created, location: @participante }
          format.js
      else
          format.html { render action: "new" }
          format.json { render json: @participante.errors, status: :unprocessable_entity }
          format.js
      end
    end
  end

  # PUT /participantes/1
  # PUT /participantes/1.json
  def update
    @participante = Participante.find(params[:id])
    @proceso = Proceso.find(params[:proceso_id])
    @rol_participantes = RolParticipante.all
    @displaycamposOpcionalesParticipante = params[:displayOpcionales]
    @participante.activo = true

    respond_to do |format|
      if @participante.update_attributes(params[:participante])
        #Traza de log
        Log.create(:usuario => current_abogado.email,:proceso => @proceso.tipo_proceso.tipo+' - '+@proceso.titulo ,:abogado_id => current_abogado.id ,:proceso => @proceso, :participante_id => @participante.id, :mensaje_id => 2 ,:mensaje=> current_abogado.email.to_s+', Modifico el participante: '+@participante.nombre+' '+@participante.apellido)

        format.html { redirect_to @participante, notice: 'Participante was successfully updated.' }
        format.json { head :no_content }
        format.js
      else
        format.html { render action: "index" }
        format.json { render json: @participante.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /participantes/1
  # DELETE /participantes/1.json
  def destroy
    @participante = Participante.find(params[:id])
    @proceso = @participante.proceso

    Log.create(:usuario => current_abogado.nombre,:proceso => @proceso.tipo_proceso.tipo+' - '+@proceso.titulo ,:usuario_id => current_abogado.id ,:proceso => @proceso, :participante_id => @participante.id, :mensaje_id => 2 ,:mensaje=> current_abogado.nombre.to_s+', Elimino el participante: '+@participante.nombre+' '+@participante.apellido)
    
    #No se elimina por completo el participante, se deshabilita unicamente
    #En caso que se desee restablecer el participante
    #@participante.destroy  - No
    @participante.update_attribute(:activo, false)
    
    respond_to do |format|
      #Traza de log
      format.html { redirect_to participantes_url }
      format.json { head :no_content }
      format.js
    end
  end
end
