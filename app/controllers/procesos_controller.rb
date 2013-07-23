class ProcesosController < ApplicationController
  # GET /procesos
  # GET /procesos.json
  def index
   # @procesos = Proceso.all
    @procesos = current_user.procesos
    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @procesos }
    end
  end

  # GET /procesos/1
  # GET /procesos/1.json
  def show
    @proceso = Proceso.find(params[:id])
    #Recupera los 3 ultimos particpantes modificados pertenecientes a el proceso.
    @participantes = @proceso.participantes.order("updated_at DESC").first(3)
    #Recuperar los usuarios del sistema
    @usuarios = Usuario.all
    #Recuperar los usuarios ligados al proceso
    @usuariosDelproceso =  @proceso.usuarios
    #Variable para crear el control de acceso y lograr compartir los procesos a otros usuarios
    @control_acceso = ControlAcceso.new
    #recuperar los contratos del proceso
    @contratos = @proceso.contratos.order("updated_at DESC").first(3)

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
    @proceso.usuario_id = current_user.id
    @proceso.favorito = false

    respond_to do |format|
      if @proceso.save
        #Salvar relacion entre el proecso y el usuario que lo creo
        @proceso.control_accesos.create(:usuario_id => current_user.id,:proceso_id => @proceso.id)
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
