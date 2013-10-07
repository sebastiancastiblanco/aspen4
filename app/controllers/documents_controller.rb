class DocumentsController < ApplicationController
  # GET /documents
  # GET /documents.json
  def index
    @documents = Document.all
    @proceso = Proceso.find(params[:proceso_id])


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
    @document.proceso_id = params[:proceso_id]


    respond_to do |format|
      if @document.save
        format.html { redirect_to action: "index",  proceso_id: params[:proceso_id] }
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

    respond_to do |format|
      if @document.update_attributes(params[:document])
        format.html { redirect_to action: "index",  proceso_id: params[:proceso_id] }
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
    @proceso = @document.proceso_id
    @document.destroy

    respond_to do |format|
      format.html {  redirect_to action: "index",  proceso_id: @proceso }
      format.json { head :no_content }
    end
  end
end

