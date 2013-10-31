class ReportesController < ApplicationController
  def index
  	#Recuperar el ultimo proceso modificado del usuario y mostrar el reporte
  	#recuperar todos los procesos del usaurio para listarlos en un combo box.
  	@proceso = current_user.procesos.order('created_at DESC').last
    @logs = Log.where(usuario_id: current_user.id).order('created_at DESC').limit(4)
    @procesos = current_user.procesos

    #ultimos movimientos de un proceso en especifico
    @procesoLog = Log.where(proceso_id: @proceso.id ).order('updated_at DESC').limit(3)
    @alertasPendientes = @proceso.alertas.where("termina < ?", Time.now).order("updated_at DESC").limit(3);
    @actividades = @proceso.actividads.activos.order('updated_at DESC').limit(3)
    @documentos = @proceso.documents.activos.order('updated_at DESC').limit(3)

  	respond_to do |format|
      format.html # index.html.erb
    end
  end

  def reporteProceso
   @proceso = Proceso.find(params[:proceso_id])
   #ultimos movimientos de un proceso en especifico
    @procesoLog = Log.where(proceso_id: @proceso.id ).order('updated_at DESC').limit(3)
    @alertasPendientes = @proceso.alertas.where("termina < ?", Time.now).order("updated_at DESC").limit(3);
    @actividades = @proceso.actividads.activos.order('updated_at DESC').limit(3)
    @documentos = @proceso.documents.activos.order('updated_at DESC').limit(3)

   
    respond_to do |format|
      format.js 
    end
  end

end
