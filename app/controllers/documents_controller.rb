class DocumentsController < ApplicationController
  # GET /documents
  # GET /documents.json

  # debe esta logeado para iniciar a las paginas
  before_filter :authenticate_abogado!
  
  def index
    @proceso = Proceso.find(params[:proceso_id])
    @documents = @proceso.documents
    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @documents }
    end
  end

  # GET /documents/1
  # GET /documents/1.json
  def show
    @document = Document.find(params[:documento_id])
    @proceso = Proceso.find(params[:proceso_id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @document }
    end
  end

  # GET /documents/new
  # GET /documents/new.json
  def new
    @document = Document.new
    @proceso = Proceso.find(params[:proceso_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @document }
    end
  end

  # GET /documents/1/edit
  def edit
    @document = Document.find(params[:documento_id])
    @proceso = Proceso.find(params[:proceso_id])
  end

  # POST /documents
  # POST /documents.json
  def create
    @document = Document.new(params[:document])
    @proceso = Proceso.find(params[:proceso_id])
    @document.proceso_id = params[:proceso_id]
    @document.usuario_id = current_abogado.id
    @document.activo = true

    respond_to do |format|
      if @document.save
         #Traza de log
         Log.create(:usuario => current_abogado.email,:proceso => @proceso.tipo_proceso.tipo+' - '+@proceso.titulo ,:usuario_id => current_abogado.id ,:proceso => @proceso, :documento_id => @document.id, :mensaje_id => 6 ,:mensaje=> current_abogado.email.to_s+', adjunto un nuevo documento: '+@document.name)

        format.html { redirect_to action: "index",proceso_id: params[:proceso_id], notice: 'Se adjunto un nuevo documento.'}
        format.json { render json: @document, status: :created, location: @document }
      else
        format.html { render action: "new" }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end


  # PUT /documents/1
  # PUT /documents/1.json
  def update
    @document = Document.find(params[:id])
    @proceso = Proceso.find(params[:proceso_id])
    @document.activo = true

    respond_to do |format|
      if @document.update_attributes(params[:document])
         #Traza de log
         Log.create(:usuario => current_abogado.email,:proceso => @proceso.tipo_proceso.tipo+' - '+@proceso.titulo ,:usuario_id => current_abogado.id ,:proceso => @proceso, :documento_id => @document.id, :mensaje_id => 6 ,:mensaje=> current_abogado.email.to_s+', modifico el documento adjunto : '+@document.name)

        format.html { redirect_to action: "index",  proceso_id: params[:proceso_id], notice: 'Se modifco el documento correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    @document = Document.find(params[:id])
    @proceso = Proceso.find(params[:proceso_id])
    #Traza de log
    Log.create(:usuario => current_abogado.email,:proceso => @proceso.tipo_proceso.tipo+' - '+@proceso.titulo ,:usuario_id => current_abogado.id ,:proceso => @proceso, :documento_id => @document.id, :mensaje_id => 6 ,:mensaje=> current_abogado.email.to_s+', modifico el documento adjunto : '+@document.name)
    @document.destroy

    respond_to do |format|
      format.html {  redirect_to action: "index",  proceso_id: @proceso, notice: 'Se elimino el documento correctamente.'}
      format.json { head :no_content }
    end
  end

  def registrar
    @documentoregistro =  Document.find(params[:documentoid])
    @documentoregistro.activo = true
    @documentoregistro.save
    render :json => @documentoregistro
  end

   def noregistrar
    @documentoregistro =  Document.find(params[:documentoid])
    @documentoregistro.activo = false
    @documentoregistro.save
    render :json => @documentoregistro
  end
end