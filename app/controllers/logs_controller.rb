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
	when 1    #compare to 1
	  redirect_back_or_to(@log.proceso , message: "login exitoso")
	when 6    #compare to 2
	 redirect_back_or_to(procesos_path)
	else
	   redirect_back_or_to(procesos_path)
	end

 end

end
