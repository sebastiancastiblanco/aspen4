class InvitacionsController < ApplicationController
  # debe esta logeado para iniciar a las paginas
  before_filter :authenticate_abogado!
  
  def index
    @invitacions = Invitacion.solicitud(current_abogado.email)
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @invitacions }
    end
  end

  def show
  end

  def new
    @invitacion = Invitacion.new
    @abogado = Abogado.find(params[:abogado_id])
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @invitacion }
    end
  end

  def create
    @invitacion = Invitacion.new(params[:invitacion])
    @abogado = Abogado.find(params[:abogado_id])
    @invitacion.aceptado = false
    @invitacion.tomail = params[:tomail]
    @invitacion.abogado_id = @abogado.id
    @invitacions = Invitacion.solicitud(current_abogado.email)

   respond_to do |format|
   if @invitacion.save
    # Enviar un mail para que se registre en aspen. 
        #enviar mail de bienvenida
      threads = []
      threads << Thread.new do
           ContactoMailer.enviarInvitacion(current_abogado,@invitacion.tomail).deliver
      end
      threads.each(&:join)
    # En caso que ya exista un registro. el usuario debera aceptar la invitacion de amistad que le han enviado.
      format.js
   end
   end
  end

  def edit
  end

  def update
  end

  def destroy
    #Eliminar la invitacion de la lista por id 
    @invitacion = Invitacion.find(params[:id])
    @invitacion.destroy

    respond_to do |format|
      #Traza de log
      format.html { redirect_to invitacions_url }
      format.json { head :no_content }
      format.js
    end
  end

  def confirmarInvitacion
    #En esta parte se creara la asociacion bilateral de loas abogados en la entidad Colegas
    # y la entidad invitacion se transformara en true (aceptada).
    @invitacion = Invitacion.find(params[:invitacion_id])
    @invitacion.update_attribute(:aceptado, true)
    @invitacions = Invitacion.solicitud(current_abogado.email)
    
    #hay que evitar repeticion de colegas
    @cantidad = Colega.where(abogado_id: @invitacion.abogado.id).count
    #if @cantidad == 0
        Colega.create(:abogado_id => @invitacion.abogado.id,:abogado2 => current_abogado.id, :activo => true, :email => current_abogado.email)
        Colega.create(:abogado_id => current_abogado.id,:abogado2 => @invitacion.abogado.id, :activo => true, :email => @invitacion.abogado.email)
    #end
   
    
    #relacionar en la tabla de colegas
   respond_to do |format|
      format.html { redirect_to invitacions_url }
      format.json { render json: @invitacions }
      format.js
    end
  end

 
  
end
