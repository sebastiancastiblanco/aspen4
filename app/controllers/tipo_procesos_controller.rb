class TipoProcesosController < ApplicationController
  # GET /tipo_procesos
  # GET /tipo_procesos.json
  def index
    @tipo_procesos = TipoProceso.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tipo_procesos }
    end
  end

  # GET /tipo_procesos/1
  # GET /tipo_procesos/1.json
  def show
    @tipo_proceso = TipoProceso.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tipo_proceso }
    end
  end

  # GET /tipo_procesos/new
  # GET /tipo_procesos/new.json
  def new
    @tipo_proceso = TipoProceso.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tipo_proceso }
    end
  end

  # GET /tipo_procesos/1/edit
  def edit
    @tipo_proceso = TipoProceso.find(params[:id])
  end

  # POST /tipo_procesos
  # POST /tipo_procesos.json
  def create
    @tipo_proceso = TipoProceso.new(params[:tipo_proceso])
    #Asociar el Tipo de proceso a el usuario logeado
    @tipo_proceso.usuario_id = current_user.id

    respond_to do |format|
      if @tipo_proceso.save
        format.html { redirect_to new_proceso_path, notice: 'Tipo proceso was successfully created.' }
        format.json { render json: @tipo_proceso, status: :created, location: @tipo_proceso }
       
      else
        format.html { render action: "new" }
        format.json { render json: @tipo_proceso.errors, status: :unprocessable_entity }
        
      end
    end
  end

  # PUT /tipo_procesos/1
  # PUT /tipo_procesos/1.json
  def update
    @tipo_proceso = TipoProceso.find(params[:id])

    respond_to do |format|
      if @tipo_proceso.update_attributes(params[:tipo_proceso])
        format.html { redirect_to @tipo_proceso, notice: 'Tipo proceso was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tipo_proceso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_procesos/1
  # DELETE /tipo_procesos/1.json
  def destroy
    @tipo_proceso = TipoProceso.find(params[:id])
    @tipo_proceso.destroy

    respond_to do |format|
      format.html { redirect_to tipo_procesos_url }
      format.json { head :no_content }
    end
  end
end
