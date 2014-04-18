class LogsController < ApplicationController

 def index
     # @dias = (5.day.ago.to_date..Date.today).map{ |date| date.strftime("%b %d") }.reverse
     @dias = Log.where(abogado_id: current_abogado.id ).order('id,created_at DESC').group("id,created_at").limit(3)
     #procesos current_user.id
     @logs = Log.where(abogado_id: current_abogado.id ).order("id,proceso_id,created_at DESC")
 end

 def iractividad
 	@log = Log.find(params[:log_id])
 	#Dependiendo al tipo de mensaje (log:mensaje_id) se redirecciona a la pagina en donde ocurrio la actividad.
 	

 	case @log.mensaje_id  # a_variable is the variable we want to compare
	when 1    #Ingreso a un proceso
	  redirect_back_or_to(@log.proceso)
	when 2    # Creacion o modificacion de un participante
	 redirect_to :controller => 'participantes', :action => 'index', :proceso_id => @log.proceso.id,:participante_id => @log.participante_id, :nuevoItem => true
	when 3    # Creacion o modificacion de un contrato
	 redirect_to :controller => 'contratos', :action => 'index', :proceso_id => @log.proceso.id, :contrato_id => @log.contrato_id, :nuevoItem => true
	when 4    # Creacion o modificacion de una actividad
	 redirect_to :controller => 'actividads', :action => 'index', :proceso_id => @log.proceso.id, :actividad_id => @log.actividad_id, :nuevoItem => true
	when 5    # Creacion o modificacion de una alerta
	 redirect_to :controller => 'alertas', :action => 'edit', :proceso_id => @log.proceso.id, :alerta_id => @log.alertas_id
	when 6    # Creacion o modificacion de un documento
	 redirect_to :controller => 'documents', :action => 'edit', :proceso_id => @log.proceso.id, :documento_id => @log.documento_id
	when 7    # Creacion o modificacion de una conclusion
	 redirect_to :controller => 'estados', :action => 'edit', :proceso_id => @log.proceso.id, :estado_id => @log.estado_id
	when 8    # Creacion o modificacion de una conclusion
	 redirect_to :controller => 'procesos', :action => 'edit', :id => @proceso.id
	else
	   redirect_back_or_to(procesos_path)
	end

 end

end
