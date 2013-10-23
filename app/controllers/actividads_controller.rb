class ActividadsController < ApplicationController
  # GET /actividads
  # GET /actividads.json
  def index
    @proceso = Proceso.find(params[:proceso_id])
    @actividads = @proceso.actividads
    @actividadesRender = (params[:nuevoItem])
    if params[:actividad_id]
       @actividad = Actividad.find(params[:actividad_id])
    else
       @actividad = Actividad.new
    end
    @estadoActividads = EstadoActividad.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @actividads }
    end
  end

  # GET /actividads/1
  # GET /actividads/1.json
  def show
    @actividad = Actividad.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @actividad }
    end
  end

  # GET /actividads/new
  # GET /actividads/new.json
  def new
    @actividad = Actividad.new
    @proceso = Proceso.find(params[:id])
    @estadoActividads = EstadoActividad.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @actividad }
      format.js
    end
  end

  # GET /actividads/1/edit
  def edit
    @actividad = Actividad.find(params[:id])
    @proceso = Proceso.find(params[:proceso_id])
    @actividads = @proceso.actividads
    @actividadesRender = (params[:nuevoItem])
    @estadoActividads = EstadoActividad.all   

     respond_to do |format|
        format.html
        format.js
    end 
    
  end

  # POST /actividads
  # POST /actividads.json
  def create
    @actividad = Actividad.new(params[:actividad])
    @proceso = Proceso.find(params[:proceso_id])
    #Relacionar el proceso con las actividades
    @actividad.proceso_id = @proceso.id
    @estadoActividads = EstadoActividad.all
    @displaycamposOpcionalesActividad = params[:displayOpcionales]
    @actividad.activo = true

    respond_to do |format|
      if @actividad.save
        #Traza de log
        Log.create(:usuario => current_user.nombre,:proceso => @proceso.tipo_proceso.tipo+' - '+@proceso.titulo ,:usuario_id => current_user.id ,:proceso => @proceso, :actividad_id => @actividad.id, :mensaje_id => 4 ,:mensaje=> current_user.nombre.to_s+', Creo la actividad: '+@actividad.nombre)

        format.html { redirect_to @proceso, notice: 'Actividad fue creada correctamente' }
        format.json { render json: @actividad, status: :created, location: @actividad }
         format.js
      else
        format.html { render action: "new" }
        format.json { render json: @actividad.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PUT /actividads/1
  # PUT /actividads/1.json
  def update
    @actividad = Actividad.find(params[:id])
    @proceso = Proceso.find(params[:proceso_id])
    @estadoActividads = EstadoActividad.all
    @displaycamposOpcionalesActividad = params[:displayOpcionales]
    @actividad.activo = true

    respond_to do |format|
      if @actividad.update_attributes(params[:actividad])
        #Traza de log
        Log.create(:usuario => current_user.nombre,:proceso => @proceso.tipo_proceso.tipo+' - '+@proceso.titulo ,:usuario_id => current_user.id ,:proceso => @proceso, :actividad_id => @actividad.id, :mensaje_id => 4 ,:mensaje=> current_user.nombre.to_s+', Modifico la actividad: '+@actividad.nombre)
        
        format.html { redirect_to @proceso, notice: 'Actividad fue modificada correctamente.' }
        format.json { head :no_content }
        format.js
      else
        format.html { render action: "edit" }
        format.json { render json: @actividad.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /actividads/1
  # DELETE /actividads/1.json
  def destroy
    @actividad = Actividad.find(params[:id])
    @proceso = @actividad.proceso
    #@actividad.destroy
    @actividad.update_attribute(:activo, false)
    
    respond_to do |format|
      #Traza de log
      Log.create(:usuario => current_user.nombre,:proceso => @proceso.tipo_proceso.tipo+' - '+@proceso.titulo ,:usuario_id => current_user.id ,:proceso => @proceso, :actividad_id => @actividad.id, :mensaje_id => 4 ,:mensaje=> current_user.nombre.to_s+', Elimino la actividad: '+@actividad.nombre)

      format.html { redirect_to actividads_url }
      format.json { head :no_content }
      format.js
    end
  end

 #Filtrado de las actividades
 def filtrado
    @proceso = Proceso.find(params[:proceso_id])
    @filtro = params[:estado_id]


    if (params[:estado_id]== "0")
      @actividads = @proceso.actividads
    else
      @actividads = @proceso.actividads.joins(:estado_actividad).where(estado_actividads: {id: params[:estado_id]})
    end
    #render :json => @actividades
     respond_to do |format|
      format.js
    end
 end

 #Recuperar las activiaddes pendites del usuario, en todos los procesos
  def actividadesPendientes
     @actividadesPendientes = current_user.actividads.where("fechaSeguimiento < ?", Time.now).order("updated_at DESC");
     @actividadesProximas = current_user.actividads.where("fechaSeguimiento >= ?", Time.now ).order("updated_at DESC").limit(3);

  end

end
