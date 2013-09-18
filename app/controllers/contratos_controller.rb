class ContratosController < ApplicationController
  # GET /contratos
  # GET /contratos.json
  def index
    
    @proceso = Proceso.find(params[:proceso_id])
    @contratos = @proceso.contratos
    @contratosRender = (params[:nuevoItem])
    if params[:contrato_id]
       @contrato = Contrato.find(params[:contrato_id])
    else
       @contrato = Contrato.new
    end
    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contratos }
      format.js
    end
  end

  # GET /contratos/1
  # GET /contratos/1.json
  def show
    @contrato = Contrato.find(params[:id])
    @proceso = Proceso.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @contrato }
    end
  end

  # GET /contratos/new
  # GET /contratos/new.json
  def new
    @contrato = Contrato.new
    @proceso = Proceso.find(params[:id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contrato }
      format.js
    end
  end

  # GET /contratos/1/edit
  def edit
    @contrato = Contrato.find(params[:id])
    @proceso = Proceso.find(params[:proceso_id])
    @participantesRender = (params[:nuevoItem])
    @contratos = @proceso.contratos

     respond_to do |format|
        format.html
        format.js
    end
  end

  # POST /contratos
  # POST /contratos.json
  def create
    @contrato = Contrato.new(params[:contrato])
    @proceso = Proceso.find(params[:proceso_id])
    @contrato.proceso_id = @proceso.id
    @displaycamposOpcionalesContrato = params[:displayOpcionales]
    @contrato.activo = true

    respond_to do |format|
      if @contrato.save
        #Traza de log
        Log.create(:usuario => current_user.username,:proceso => @proceso.tipo_proceso.tipo+' - '+@proceso.titulo ,:usuario_id => current_user.id ,:proceso => @proceso, :contrato_id => @contrato.id, :mensaje_id => 3 ,:mensaje=> current_user.username.to_s+', Creo el contrato: '+@contrato.objeto)

        format.html { redirect_to @contrato, notice: 'Contrato was successfully created.' }
        format.json { render json: @contrato, status: :created, location: @contrato }
        format.js
      else
        format.html { render action: "index" }
        format.json { render json: @contrato.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PUT /contratos/1
  # PUT /contratos/1.json
  def update
    @contrato = Contrato.find(params[:id])
    @proceso = Proceso.find(params[:proceso_id])
    @displaycamposOpcionalesContrato = params[:displayOpcionales]
    @contrato.activo = true

    respond_to do |format|
      if @contrato.update_attributes(params[:contrato])
        #Traza de log
        Log.create(:usuario => current_user.username,:proceso => @proceso.tipo_proceso.tipo+' - '+@proceso.titulo ,:usuario_id => current_user.id ,:proceso => @proceso, :contrato_id => @contrato.id, :mensaje_id => 3 ,:mensaje=> current_user.username.to_s+', Modifico el contrato: '+@contrato.objeto)

        format.html { redirect_to @proceso, notice: 'Contrato was successfully updated.' }
        format.json { head :no_content }
        format.js
      else
        format.html { render action: "edit" }
        format.json { render json: @contrato.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /contratos/1
  # DELETE /contratos/1.json
  def destroy
    @contrato = Contrato.find(params[:id])
    @proceso = @contrato.proceso
    #@contrato.destroy
    @contrato.update_attribute(:activo, false)


    respond_to do |format|
      #Traza de log
      Log.create(:usuario => current_user.username,:proceso => @proceso.tipo_proceso.tipo+' - '+@proceso.titulo ,:usuario_id => current_user.id ,:proceso => @proceso, :contrato_id => @contrato.id, :mensaje_id => 3 ,:mensaje=> current_user.username.to_s+', Elimino el contrato: '+@contrato.objeto)

      format.html { redirect_to contratos_url }
      format.json { head :no_content }
      format.js
    end
  end
end
