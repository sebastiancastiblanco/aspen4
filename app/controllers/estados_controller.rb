class EstadosController < ApplicationController
  # GET /estados
  # GET /estados.json

  # debe esta logeado para iniciar a las paginas
  before_filter :authenticate_abogado!
  
  def index
    @proceso = Proceso.find(params[:proceso_id])
    @estados = @proceso.estados.where(activo: true)
   

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @estados }
    end
  end

  # GET /estados/1
  # GET /estados/1.json
  def show
    @estado = Estado.find(params[:id])
    @proceso = Proceso.find(params[:proceso_id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @estado }
    end
  end

  # GET /estados/new
  # GET /estados/new.json
  def new
    @estado = Estado.new
    @proceso = Proceso.find(params[:proceso_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @estado }
    end
  end

  # GET /estados/1/edit
  def edit
    @estado = Estado.find(params[:estado_id])
    @proceso = Proceso.find(params[:proceso_id])

  end

  # POST /estados
  # POST /estados.json
  def create
    @estado = Estado.new(params[:estado])
    @estado.proceso_id = params[:proceso_id]
    @proceso = Proceso.find(params[:proceso_id])
    @estado.activo = true

    respond_to do |format|
      if @estado.save
        #Traza de log
        Log.create(:usuario => current_abogado.email,:proceso => @proceso.tipo_proceso.tipo+' - '+@proceso.titulo ,:usuario_id => current_abogado.id ,:proceso => @proceso, :estado_id => @estado.id, :mensaje_id => 7 ,:mensaje=> current_abogado.email.to_s+', Creo la conclusion: '+@estado.conclusion)

        format.html { redirect_to action: "index",  proceso_id: params[:proceso_id], notice: 'Se creo la conclusion correctamente.' }
        format.json { render json: @estado, status: :created, location: @estado }
      else
        format.html { render action: "new" }
        format.json { render json: @estado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /estados/1
  # PUT /estados/1.json
  def update
    @estado = Estado.find(params[:id])
    @proceso = Proceso.find(params[:proceso_id])
    @estado.activo = true


    respond_to do |format|
      if @estado.update_attributes(params[:estado])
         #Traza de log
         Log.create(:usuario => current_abogado.email,:proceso => @proceso.tipo_proceso.tipo+' - '+@proceso.titulo ,:usuario_id => current_abogado.id ,:proceso => @proceso, :estado_id => @estado.id, :mensaje_id => 7 ,:mensaje=> current_abogado.email.to_s+', Modifico la conclusion: '+@estado.conclusion)

        format.html { redirect_to action: "index",  proceso_id: params[:proceso_id] }
        format.html { redirect_to @estado, notice: 'Estado was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @estado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estados/1
  # DELETE /estados/1.json
  def destroy
    @estado = Estado.find(params[:id])
    @proceso = Proceso.find(params[:proceso_id])
    
     #Traza de log
     Log.create(:usuario => current_abogado.email,:proceso => @proceso.tipo_proceso.tipo+' - '+@proceso.titulo ,:usuario_id => current_abogado.id ,:proceso => @proceso, :estado_id => @estado.id, :mensaje_id => 7 ,:mensaje=> current_abogado.email.to_s+', Elimino la conclusion: '+@estado.conclusion)

    @estado.update_attribute(:activo, false)

    respond_to do |format|
      format.html {  redirect_to action: "index",  proceso_id: @proceso, notice: 'Se elimino la conclusion correctamente.' }
      format.json { head :no_content }
    end
  end
end
