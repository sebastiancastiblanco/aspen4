class ProcesosController < ApplicationController
  before_filter :require_login

  # GET /procesos
  # GET /procesos.json
  def index
    
    @procesos = current_user.procesos
    #estados de los procesos
    @estadosProcesos = EstadoProceso.all

 
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
    @participantes = @proceso.participantes.where(activo: true).order("updated_at DESC").first(3)
    #Recuperar los usuarios del sistema
    @usuarios = Usuario.all
    #Recuperar los usuarios ligados al proceso
    @usuariosDelproceso =  @proceso.usuarios
    #Variable para crear el control de acceso y lograr compartir los procesos a otros usuarios
    @control_acceso = ControlAcceso.new
    #recuperar los contratos del proceso
    @contratos = @proceso.contratos.order("updated_at DESC").first(3)
    #recuperar las 3 ultimas actividades modificadas
    @actividads = @proceso.actividads.order("updated_at DESC").first(3)
    #Recuperar los 3 ultimos movimientos hechos en el proceso
    @logs = Log.where(usuario_id: current_user.id, proceso_id: @proceso.id ).order('created_at DESC').limit(3)
    #estados de los procesos
    @estadosProcesos = EstadoProceso.all

    #Variables Gon, pasar variable proceso para uso en codigo JS
    gon.proceso_id = @proceso.id
    #Variable cantidad de usuarios en el proces
    gon.cantidadUsuarios = @proceso.usuarios.size

    #Traza de log
    #Log.create(:usuario => current_user.username,:proceso => @proceso.tipo_proceso.tipo+' - '+@proceso.titulo ,:usuario_id => current_user.id ,:proceso => @proceso,:mensaje_id => 1 ,:mensaje=> current_user.username.to_s+' ingreso al proceso #Ref-'+@proceso.id.to_s)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @proceso }
    end
  end

  # GET /procesos/new
  # GET /procesos/new.json
  def new
    @proceso = Proceso.new
    #Para el combo de tipos de procesos
    @tipos_procesos = current_user.tipo_procesos
    #Para el item tipos de proceso
    @tipo_proceso = TipoProceso.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @proceso }
    end
  end

  # GET /procesos/1/edit
  def edit
    @proceso = Proceso.find(params[:id])
    #Para el combo de tipos de procesos
    @tipos_procesos = current_user.tipo_procesos
    #Para el item tipos de proceso
    @tipo_proceso = TipoProceso.new
    
  end

  # POST /procesos
  # POST /procesos.json
  def create
    @proceso = Proceso.new(params[:proceso])
    @proceso.usuario_id = current_user.id
    @proceso.estado_proceso_id = 1
    @proceso.favorito = false
    #Para el combo de tipos de procesos
    @tipos_procesos = current_user.tipo_procesos
    #Para el item tipos de proceso
    @tipo_proceso = TipoProceso.new

    respond_to do |format|
      if @proceso.save
        #Salvar relacion entre el proecso y el usuario que lo creo
        @proceso.control_accesos.create(:usuario_id => current_user.id,:proceso_id => @proceso.id)
        
       format.html { redirect_to @proceso, notice: 'El proceso fue creado correctamente.'  }

      else
        format.html { render action: "new" }
        format.json { render json: @proceso.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PUT /procesos/1
  # PUT /procesos/1.json
  def update
    @proceso = Proceso.find(params[:id])

    respond_to do |format|
      if @proceso.update_attributes(params[:proceso])
        format.html { redirect_to @proceso, notice: 'El proceso fue actualizado.' }
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

  #Metodo para convertir el proceso en favorito
  def favorito
    @procesofavorito =  Proceso.find( params[:procesoid])
    @procesofavorito.favorito = true
    @procesofavorito.save
    render :json => @procesofavorito
  end

  #Metodo para convertir el proceso en No favorito
  def nofavorito
    @procesofavorito =  Proceso.find( params[:procesoid])
    @procesofavorito.favorito = false
    @procesofavorito.save
    render :json => @procesofavorito
  end

  #Cantidad de usuarios
  def cantidadUsuarios
    @proceso =  Proceso.find( params[:procesoid])
    render :json => @proceso.usuarios
  end

  def eventos
    @proceso =  Proceso.find( params[:proceso_id])
    @logs = Log.where(usuario_id: current_user.id, proceso_id: @proceso.id ).order('created_at DESC')
  end

  def estadoProceso
     @proceso =  Proceso.find( params[:procesoid])
     @proceso.update_attribute(:estado_proceso_id,  params[:estadoProcesoid])
     render :json => @proceso
  end
  
end
