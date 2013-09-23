class UsuariosController < ApplicationController
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
  end

  # GET /usuarios/1/edit
  def edit
    @usuario = Usuario.find(params[:id])
  end

  # POST /usuarios
  # POST /usuarios.json
  def create
    @usuario = Usuario.new(params[:usuario])

   
      if @usuario.save
        #Realizar auto login y redireccionar a la pagina de procesos
          auto_login(@usuario)
          render :js => "window.location = 'procesos'"
      else
         respond_to do |format|
          format.html { render action: "new" }
          format.js
        end
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
  end

  def planprecios
     @usuario = Usuario.new
  end

  def recuperarContresena
    #Buscar el correo del usuario, en minusculas
    @cantidadUsuario = Usuario.where(username: params[:username]).count
    @existeusuario = false
    #Si existe enviar mail con acceso para recuperar la contraseña y actualizar mensaje del panel
    if @cantidadUsuario == 0 
      @usuario = Usuario.new(params[:usuario])
      #En caso contrario, actualizar mensaje del panel
      @usuario.errors[:username] << "no existe una vuenta bajo este correo"
    else
      @existeusuario = true
    end
    
    respond_to do |format|
      format.js
    end

  end


end
