class LogsController < ApplicationController

 def index
     # @dias = (5.day.ago.to_date..Date.today).map{ |date| date.strftime("%b %d") }.reverse
     @dias = Log.where(usuario_id: current_user.id ).limit(3).order('created_at DESC').group("date(created_at)")
     #procesos current_user.id
     @logs = Log.where(usuario_id: current_user.id ).order("proceso_id").order('created_at DESC')
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
	else
	   redirect_back_or_to(procesos_path)
	end

 end

end
