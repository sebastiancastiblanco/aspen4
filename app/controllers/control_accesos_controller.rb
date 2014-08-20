class ControlAccesosController < ApplicationController
  # GET /control_accesos
  # GET /control_accesos.json

  # debe esta logeado para iniciar a las paginas
  before_filter :authenticate_abogado!
  # autocomplete para el abogado y seleccion de usuario
  autocomplete :abogado, :email, full: true 

  def abogadoAutocomplete
    
    #@abogados = Abogado.find(:all, :conditions => ['email LIKE ?', "%#{params[:term]}%"])
    #@abogados = Colega.find(:all, :conditions => ['abogado_id = ? AND email LIKE ?',current_abogado.id, "%#{params[:term]}%"])
    @abogados = current_abogado.colegas.where("email LIKE ? ", "%#{params[:term]}%")

#    @colegas.each do |colega|
 #     @abogados << Abogado.buscarAbogado(colega.abogado2);
  #  end

    @abogados_hash = []
    @abogados.each do |b|
       #@abogado = b.abogado;
        @abogados_hash << { 
            :label => b["email"], 
            :value => b["abogado2"], 
            #:label => @abogado.email,
            #:value => @abogado.id,
        }
    end
    render :json => @abogados_hash
  end


  def index
    @control_accesos = ControlAcceso.all
    @control_acceso = ControlAcceso.new
    @usuarios =  Abogado.all
    
    @abogado = Abogado.new

    @procesos = current_abogado.procesos
    @privilegios = Privilegio.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @control_accesos }
    end
  end

  # GET /control_accesos/1
  # GET /control_accesos/1.json
  def show
    @control_acceso = ControlAcceso.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @control_acceso }
    end
  end

  # GET /control_accesos/new
  # GET /control_accesos/new.json
  def new
    @control_acceso = ControlAcceso.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @control_acceso }
    end
  end

  # GET /control_accesos/1/edit
  def edit
    @control_acceso = ControlAcceso.find(params[:id])
  end

  # POST /control_accesos
  # POST /control_accesos.json
  def create
    @control_acceso = ControlAcceso.new(params[:control_acceso])

    if !@control_acceso.proceso_id.nil?
     if !@control_acceso.abogado_id.nil?
      if !@control_acceso.privilegio_id.nil? 

          @abogado = Abogado.find(@control_acceso.abogado_id)

          #buscar el proceso y usuario, si ya existe solo se actualiza el atributo de privilegio
          @accesoCreado = ControlAcceso.buscarProcesoAcceso(@control_acceso.proceso_id, @control_acceso.abogado_id);
          
          #Enviar Correo el cual notifica que se comparte el proceso
          threads = []
            threads << Thread.new do
                 ContactoMailer.compartirProcesoUsuario(current_abogado,@control_acceso.proceso,@abogado.email).deliver
            end
          threads.each(&:join)

          if !@accesoCreado.any?
            respond_to do |format|
            if @control_acceso.save
              format.html { redirect_to procesos_path , notice: 'Se ha compartido el proceso '+@control_acceso.proceso.referencia+' a '+ @control_acceso.abogado.email and return}
              format.json { render json: @control_acceso, status: :created, location: @control_acceso }
            else
              format.html { render action: "new" }
              format.json { render json: @control_acceso.errors, status: :unprocessable_entity }
            end
          end
          else
            respond_to do |format|
              if  @accesoCreado.last.update_attribute(:privilegio_id, @control_acceso.privilegio_id)
                format.html { redirect_to procesos_path , notice: 'Se ha compartido el proceso '+@control_acceso.proceso.referencia+' a '+ @control_acceso.abogado.email and return }
                format.json { render json: @control_acceso, status: :created, location: @control_acceso }
              else
                format.html { render action: "new" }
                format.json { render json: @control_acceso.errors, status: :unprocessable_entity }
              end
          end
          end

      end
      
      respond_to do |format|
        format.html { redirect_to :compartirProcesos , alert:'Seleccione un privilegio para el proceso' and return}
        format.js
      end
     end
     
      respond_to do |format|
        format.html { redirect_to :compartirProcesos , alert:'Seleccione un usuario para el proceso' and return }
        format.js
      end
    end
    
    respond_to do |format|
      format.html { redirect_to :compartirProcesos , alert:'Seleccione un proceso para compartir' and return }
      format.js
    end


  end

  # PUT /control_accesos/1
  # PUT /control_accesos/1.json
  def update
    @control_acceso = ControlAcceso.find(params[:id])

    respond_to do |format|
      if @control_acceso.update_attributes(params[:control_acceso])
        format.html { redirect_to @control_acceso, notice: 'Control acceso was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @control_acceso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /control_accesos/1
  # DELETE /control_accesos/1.json
  def destroy
    @control_acceso = ControlAcceso.find(params[:id])
    @control_acceso.destroy

    respond_to do |format|
      format.html { redirect_to control_accesos_url }
      format.json { head :no_content }
    end
  end

  # COMPARTIR PROCESO
  # Funcion para copartir un proceso con otro usuario, esta funcino la usa el form en la pagina principal del proceso
  def compartirProceso
    @control_acceso = ControlAcceso.new(params[:control_acceso])
    @proceso = Proceso.find(params[:proceso_id])
    @control_acceso.proceso_id = @proceso.id
    respond_to do |format|
      if @control_acceso.save
        format.html { redirect_to @proceso}
        format.js
      else
        format.html { render action: "new" }
        format.js
      end
    end
  end


  
end

  