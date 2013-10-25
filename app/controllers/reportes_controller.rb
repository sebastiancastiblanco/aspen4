class ReportesController < ApplicationController
  
  def index
  	#Recuperar el ultimo proceso modificado del usuario y mostrar el reporte
  	#recuperar todos los procesos del usaurio para listarlos en un combo box.
  	@proceso = Proceso.last
  	respond_to do |format|
      format.html # index.html.erb
    end
  end

  def reporteProceso
  end
end
