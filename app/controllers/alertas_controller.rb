class AlertasController < ApplicationController
  # GET /alerta
  # GET /alerta.json
  def index
    @alerta = Alerta.all
    @proceso = Proceso.find(params[:proceso_id])


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

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @alerta }
    end
  end

  # GET /alerta/1/edit
  def edit
    logger.debug "Edit alerta"
    @alerta = Alerta.find(params[:id])
        logger.debug "Edit post: #{@alerta.attributes.inspect}"

  end

  # POST /alerta
  # POST /alerta.json
  def create
    @alerta = Alerta.new(params[:alerta])
    @alerta.proceso_id = params[:proceso_id]
    respond_to do |format|
      if @alerta.save
        format.html { redirect_to action: "index",  proceso_id: params[:proceso_id] }
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

    respond_to do |format|
      if @alerta.update_attributes(params[:alerta])
        format.html { redirect_to action: "index",  proceso_id: params[:proceso_id] }
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
    @proceso = @alerta.proceso_id
    @alerta.destroy

    respond_to do |format|
      format.html {  redirect_to action: "index",  proceso_id: @proceso }
      format.json { head :no_content }
    end
  end
end
