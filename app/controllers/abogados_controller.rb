class AbogadosController < ApplicationController
  def index
    @abogado = current_abogado
    @logs = Log.where(abogado_id: current_abogado.id).order('id,created_at DESC').limit(4)
    @procesos = current_abogado.procesos
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @abogado }
    end
  end

  def show
    @abogado = current_abogado
    @logs = Log.where(abogado_id: current_abogado.id).order('id,created_at DESC').limit(4)
    @procesos = current_abogado.procesos
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @abogado }
    end
  end

  def create
  end

  def update
     @abogado = Abogado.find(params[:id])

    respond_to do |format|
      if @abogado.update_attributes(params[:abogado])
        format.html { redirect_to @abogado, notice: 'Actualizacion terminada.' }
        format.json { head :no_content }
        format.js
      else
        format.html { render action: "edit" }
        format.json { render json: @abogado.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def edit
  end

  def destroy
    @abogado = current_abogado
    @abogado.update_attribute(:activo, false)
  end

  

end
