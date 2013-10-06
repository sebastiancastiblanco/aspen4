class EstadosController < ApplicationController
  # GET /estados
  # GET /estados.json
  def index
    @estados = Estado.all
    @proceso = Proceso.find(params[:proceso_id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @estados }
    end
  end

  # GET /estados/1
  # GET /estados/1.json
  def show
    @estado = Estado.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @estado }
    end
  end

  # GET /estados/new
  # GET /estados/new.json
  def new
    @estado = Estado.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @estado }
    end
  end

  # GET /estados/1/edit
  def edit
    @estado = Estado.find(params[:id])
  end

  # POST /estados
  # POST /estados.json
  def create
    @estado = Estado.new(params[:estado])
    @estado.proceso_id = params[:proceso_id]


    respond_to do |format|
      if @estado.save
        format.html { redirect_to action: "index",  proceso_id: params[:proceso_id] }
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

    respond_to do |format|
      if @estado.update_attributes(params[:estado])
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
    @proceso = @document.proceso_id
    @estado.destroy

    respond_to do |format|
      format.html {  redirect_to action: "index",  proceso_id: @proceso }
      format.json { head :no_content }
    end
  end
end
