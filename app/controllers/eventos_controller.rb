class EventosController < ApplicationController
	  #Recupara la lista de eventos del usuario.
  def index
    @evento = Evento.new
    #Recuperar los eventos del usuario logeado
    #@eventos = current_abogado.eventos
    @eventos = current_abogado.eventos
    #respond de la funcion
    respond_to do |format| 
      format.html # index.html.erb 
      format.json { render :json => @eventos } 
     end 
  end

  # Crea la instancia del evento a crear en el la plantilla _form.html.erb
  def new
    @evento = Evento.new
    if (params[:date])
        @evento.start = params[:date]
        @evento.end = params[:date]
    end
  end
  
  #crea el evento en el calendario,  ejecuta el archivo create.js.erb
  #Asociandolo al usuario que lo creo.
  def create
      @evento = Evento.new(params[:evento])
     zone = ActiveSupport::TimeZone.new("America/Bogota")
      
      respond_to do |format|
        if @evento.save
          #Salvar relacion entre el evento y el usuario que lo creo
          @evento.usuario_eventos.create(:abogado_id => current_abogado.id,:propietario_id => current_abogado.id,:evento_id => @evento.id,:usuario_id => current_abogado.id)
          
          @evento.start.in_time_zone(zone)
          @evento.end.in_time_zone(zone)
          @evento.save

            format.json { render json: @evento, status: :created, location: @evento }
            format.js
        else
            format.json { render json: @evento.errors, status: :unprocessable_entity }
            format.js
        end
      end
    
 end
  
  #recupera la informacion del evento y ejcuta edit.js.erb en la plantilla _edit_form.html.erb
  def edit
    @evento = Evento.find_by_id(params[:id])
     
  end
  
  #actualiza los eventos y ejecuta update.js.erb
  def update
      @evento = Evento.find_by_id(params[:id])
      respond_to do |format|
       if @evento.update_attributes(params[:evento])
           format.json { render json: @evento, status: :created, location: @evento }
           format.js
       else
           format.json { render json: @evento.errors, status: :unprocessable_entity }
           format.js
       end
      end
  end  

  #Modifica la ubicacion de los eventos y ejecuta es JS de move.js.erb
  def move
      @evento = Evento.find(params[:id])
    if @evento
      @evento.start = (params[:minute_delta].to_i).minutes.from_now((params[:day_delta].to_i).days.from_now(@event.start))
      @evento.end = (params[:minute_delta].to_i).minutes.from_now((params[:day_delta].to_i).days.from_now(@event.end))
      @evento.allDay = params[:allDay]
      @evento.save
      #En caso de que el vento sea una alerta, se debe actulizar la fecha de incio de la alerta. 
      if !@evento.alerta_id.nil?
          @alerta = Alerta.find(@evento.alerta_id)
          @alerta.termina = @evento.start
          @alerta.save!
      end
    end
  end
  
  #redimensaiona los eventos y ejecuta es JS de resize.js.erb
  def resize
    @evento = Evento.find(params[:id])

    respond_to do |format|
      if @evento
          @evento.end = (params[:minute_delta].to_i).minutes.from_now((params[:day_delta].to_i).days.from_now(@evento.end))
          @evento.save
      end    
      format.js
    end
 end
  
  #Elimina eventos y ejecuta es JS de destroy.js.erb
  def destroy
    @evento = Evento.find_by_id(params[:id])
    #desactivar la alerta desde el calendario.
    @alerta = Alerta.find(@evento.alerta_id)
    @alerta.update_attribute(:activo, false)
    @evento.destroy
    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
      format.js
    end

  end



  def get_events
    #@events = Event.find(:all, :conditions => ["starttime >= '#{Time.at(params['start'].to_i).to_formatted_s(:db)}' and endtime <= '#{Time.at(params['end'].to_i).to_formatted_s(:db)}'"] )
    @events = Evento.all 
    events = [] 
    @events.each do |event|
      events << {:id => event.id, :title => event.title, :description => event.description || "Some cool description here...", :start => "#{event.starttime.iso8601}", :end => "#{event.endtime.iso8601}", :allDay => event.all_day, :recurring => (event.event_series_id)? true: false}
    end
    render :text => events.to_json
  end
end
