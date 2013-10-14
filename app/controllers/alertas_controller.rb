class AlertasController < ApplicationController
  # GET /alerta
  # GET /alerta.json
  def index
    @proceso = Proceso.find(params[:proceso_id])
    @alerta = @proceso.alertas.where(activo: true)
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @alerta }
    end
  end

  # GET /alerta/1
  # GET /alerta/1.json
  def show
    @alerta = Alerta.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @alerta }
    end
  end

  # GET /alerta/new
  # GET /alerta/new.json
  def new
    @alerta = Alerta.new
    @proceso = Proceso.find(params[:proceso_id])
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @alerta }
    end
  end

  # GET /alerta/1/edit
  def edit
    @alerta = Alerta.find(params[:alerta_id])
    @proceso = Proceso.find(params[:proceso_id])
    
  end

  # POST /alerta
  # POST /alerta.json
  def create
    @alerta = Alerta.new(params[:alerta])
    @proceso = Proceso.find(params[:proceso_id])
    @alerta.proceso_id = params[:proceso_id]
    @alerta.activo = true
    #setear la fecha en un solo campo
    if @alerta.termina != nil && @alerta.horainicio != nil
      @alerta.termina = DateTime.new(@alerta.termina.year, @alerta.termina.month, @alerta.termina.day, @alerta.horainicio.hour, @alerta.horainicio.min, 0, 0)
      zone = ActiveSupport::TimeZone.new("Bogota")
      @alerta.termina.in_time_zone(zone)
    end
    
    

    respond_to do |format|
      if @alerta.save
       #Traza de log
       Log.create(:usuario => current_user.nombre,:proceso => @proceso.tipo_proceso.tipo+' - '+@proceso.titulo ,:usuario_id => current_user.id ,:proceso => @proceso, :alertas_id => @alerta.id, :mensaje_id => 5 ,:mensaje=> current_user.nombre.to_s+', Creo la alerta: '+@alerta.titulo)

        format.html { redirect_to action: "index",  proceso_id: params[:proceso_id], notice: 'Se programo la alerta correctamente.' }
        format.json { render json: @alerta, status: :created, location: @alerta }
      else
        format.html { render action: "new" }
        format.json { render json: @alerta.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /alerta/1
  # PUT /alerta/1.json
  def update
    @alerta = Alerta.find(params[:id])
    @proceso = Proceso.find(params[:proceso_id])
    @alerta.activo = true

    respond_to do |format|
      if @alerta.update_attributes(params[:alerta])
         #Traza de log
         Log.create(:usuario => current_user.nombre,:proceso => @proceso.tipo_proceso.tipo+' - '+@proceso.titulo ,:usuario_id => current_user.id ,:proceso => @proceso, :alertas_id => @alerta.id, :mensaje_id => 5 ,:mensaje=> current_user.nombre.to_s+', modifico la alerta: '+@alerta.titulo)

        format.html { redirect_to action: "index",  proceso_id: params[:proceso_id], notice: 'Se actualizo la alerta correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @alerta.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alerta/1
  # DELETE /alerta/1.json
  def destroy
    @alerta = Alerta.find(params[:id])
    @proceso = Proceso.find(params[:proceso_id])
    #Traza de log
    Log.create(:usuario => current_user.nombre,:proceso => @proceso.tipo_proceso.tipo+' - '+@proceso.titulo ,:usuario_id => current_user.id ,:proceso => @proceso, :alertas_id => @alerta.id, :mensaje_id => 5 ,:mensaje=> current_user.nombre.to_s+', elimino la alerta: '+@alerta.titulo)

   #No se elimina por completo el participante, se deshabilita unicamente
    #En caso que se desee restablecer el participante
    #@alerta.destroy  - No
    @alerta.update_attribute(:activo, false)

    respond_to do |format|
      format.html {  redirect_to action: "index",  proceso_id: @proceso, notice: 'Se elimino la alerta correctamente.' }
      format.json { head :no_content }
    end
  end
end
