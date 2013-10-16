class UsuariosController < ApplicationController
  autocomplete :usuario,:username => 'name', :full => true

  # GET /usuarios
  # GET /usuarios.json
  def index
    @usuarios = Usuario.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @usuarios }
    end
  end

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
     @usuario = current_user
     @procesos = current_user.procesos.order("created_at DESC").limit(3)
     @logs = Log.where(usuario_id: current_user.id ).order("proceso_id").order('updated_at DESC')

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /usuarios/new
  # GET /usuarios/new.json
  def new
    @usuario = Usuario.new
    @software_abogado = SoftwareAbogado.new
  end

  # GET /usuarios/1/edit
  def edit
    @usuario = Usuario.find(params[:id])
  end

  # POST /usuarios
  # POST /usuarios.json
  def create

    @usuario = Usuario.new(params[:usuario])
    @cantidadUsuario = Usuario.where(username: @usuario.username).count
    if @cantidadUsuario == 0
        if @usuario.save
          #Realizar auto login y redireccionar a la pagina de procesos
          auto_login(@usuario)
          #enviar mail de bienvenida
          UsuarioMails.bienvenida(@usuario).deliver
          render :js => "window.location = 'procesos'"
        else
          respond_to do |format|
            format.html { render action: "create" }
            format.js
          end
        end
     else
      flash[:notice] = 'Ya existe una cuenta asociada a este correo'
      render :js => "window.location = 'home'"
      end 
    
  end

  # PUT /usuarios/1
  # PUT /usuarios/1.json
  def update
    @usuario = Usuario.find(params[:id])

    respond_to do |format|
      if @usuario.update_attributes(params[:usuario])
        format.html { redirect_to @usuario, notice: 'El Usuario fue modificado correctamente.' }
        format.json { head :no_content }
        format.js
      else
        format.html { render action: "edit" }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
    @usuario = Usuario.find(params[:id])
    @usuario.destroy

    respond_to do |format|
      format.html { redirect_to usuarios_url }
      format.json { head :no_content }
      format.js
    end
  end

  def funcionalidades
     @usuario = Usuario.new
      @software_abogado = SoftwareAbogado.new
  end

  def planprecios
     @usuario = Usuario.new
      @software_abogado = SoftwareAbogado.new
  end

  def login
     @usuario = Usuario.new
      @software_abogado = SoftwareAbogado.new
  end

 


end
