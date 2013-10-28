class ReportesController < ApplicationController
  
  def index
  	#Recuperar el ultimo proceso modificado del usuario y mostrar el reporte
  	#recuperar todos los procesos del usaurio para listarlos en un combo box.
  	@proceso = current_user.procesos.order('created_at DESC').last
    @logs = Log.where(usuario_id: current_user.id).order('created_at DESC').limit(4)
    @procesos = current_user.procesos
  	respond_to do |format|
      format.html # index.html.erb
    end
  end

  def reporteProceso
  end
end
