class SoftwareAbogadosController < ApplicationController
  # GET /software_abogados
  # GET /software_abogados.json
  def index
    @software_abogados = SoftwareAbogado.all
    @software_abogado = SoftwareAbogado.new
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @software_abogados }
    end
  end

  # GET /software_abogados/1
  # GET /software_abogados/1.json
  def show
    @software_abogado = SoftwareAbogado.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @software_abogado }
    end
  end

  # GET /software_abogados/new
  # GET /software_abogados/new.json
  def new
    @software_abogado = SoftwareAbogado.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @software_abogado }
    end
  end

  # GET /software_abogados/1/edit
  def edit
    @software_abogado = SoftwareAbogado.find(params[:id])
  end

  # POST /software_abogados
  # POST /software_abogados.json
  def create
    @software_abogado = SoftwareAbogado.new(params[:software_abogado])

    respond_to do |format|
      if @software_abogado.save
        #Enviar correo con mensaje de agradecimiento
        UsuarioMails.registroNoticias(@software_abogado.correo).deliver

        format.html { redirect_to :home}
        format.json { render json: @software_abogado, status: :created, location: @software_abogado }
      else
        format.html { render action: "new" }
        format.json { render json: @software_abogado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /software_abogados/1
  # PUT /software_abogados/1.json
  def update
    @software_abogado = SoftwareAbogado.find(params[:id])

    respond_to do |format|
      if @software_abogado.update_attributes(params[:software_abogado])
        format.html { redirect_to @software_abogado, notice: 'Software abogado was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @software_abogado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /software_abogados/1
  # DELETE /software_abogados/1.json
  def destroy
    @software_abogado = SoftwareAbogado.find(params[:id])
    @software_abogado.destroy

    respond_to do |format|
      format.html { redirect_to software_abogados_url }
      format.json { head :no_content }
    end
  end
end
