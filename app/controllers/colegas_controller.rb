class ColegasController < ApplicationController
  # GET /colegas
  # GET /colegas.json
  def index
    @colegas = current_abogado.colegas

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @colegas }
    end
  end

  # GET /colegas/1
  # GET /colegas/1.json
  def show
    @colega = Colega.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @colega }
    end
  end

  # GET /colegas/new
  # GET /colegas/new.json
  def new
    @colega = Colega.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @colega }
    end
  end

  # GET /colegas/1/edit
  def edit
    @colega = Colega.find(params[:id])
  end

  # POST /colegas
  # POST /colegas.json
  def create
    @colega = Colega.new(params[:colega])

    respond_to do |format|
      if @colega.save
        format.html { redirect_to @colega, notice: 'Colega was successfully created.' }
        format.json { render json: @colega, status: :created, location: @colega }
      else
        format.html { render action: "new" }
        format.json { render json: @colega.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /colegas/1
  # PUT /colegas/1.json
  def update
    @colega = Colega.find(params[:id])

    respond_to do |format|
      if @colega.update_attributes(params[:colega])
        format.html { redirect_to @colega, notice: 'Colega was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @colega.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /colegas/1
  # DELETE /colegas/1.json
  def destroy
    @colega = Colega.find(params[:id])
    @colega.destroy

    respond_to do |format|
      format.js
    end
  end
end
