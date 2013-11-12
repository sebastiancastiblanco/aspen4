class EventosController < ApplicationController
  
  #Recupara la lista de eventos del usuario.
  def index
    @event = Evento.new
    #Recuperar los eventos del usuario logeado
    #@eventos = current_user.eventos
    @eventos = Evento.all
    #respond de la funcion
    respond_to do |format| 
      format.html # index.html.erb 
      format.json { render :json => @eventos } 
     end 
  end

  # Crea la instancia del evento a crear en el la plantilla _form.html.erb
  def new
    @event = Evento.new
    if (params[:date])
        @event.start = params[:date]
        @event.end = params[:date]
    end
  end
  
  #crea el evento en el calendario,  ejecuta el archivo create.js.erb
  #Asociandolo al usuario que lo creo.
  def create
      @event = Evento.new(params[:event])
      #setear la fecha en un solo campo
      

      respond_to do |format|
        if @event.save
          #Salvar relacion entre el evento y el usuario que lo creo
          @event.usuario_eventos.create(:usuario_id => current_user.id,:propietario_id => current_user.id,:evento_id => @event.id)
        
            format.json { render json: @event, status: :created, location: @event }
            format.js
        else
            format.json { render json: @event.errors, status: :unprocessable_entity }
            format.js
        end
      end
    
 end
  
  #recupera la informacion del evento y ejcuta edit.js.erb en la plantilla _edit_form.html.erb
  def edit
    @event = Evento.find_by_id(params[:id])
     
  end
  
  #actualiza los eventos y ejecuta update.js.erb
  def update
      @event = Evento.find_by_id(params[:idEvent])
      respond_to do |format|
       if @event.update_attributes(params[:event])
           format.json { render json: @event, status: :created, location: @event }
           format.js
       else
           format.json { render json: @event.errors, status: :unprocessable_entity }
           format.js
       end
      end
  end  

  #Modifica la ubicacion de los eventos y ejecuta es JS de move.js.erb
  def move
      @event = Evento.find(params[:id])
    if @event
      @event.start = (params[:minute_delta].to_i).minutes.from_now((params[:day_delta].to_i).days.from_now(@event.start))
      @event.end = (params[:minute_delta].to_i).minutes.from_now((params[:day_delta].to_i).days.from_now(@event.end))
      @event.allDay = params[:allDay]
      @event.save
    end
  end
  
  #redimensaiona los eventos y ejecuta es JS de resize.js.erb
  def resize
    @event = Evento.find(params[:id])
    respond_to do |format|
      if @event
          @event.endtime = (params[:minute_delta].to_i).minutes.from_now((params[:day_delta].to_i).days.from_now(@event.endtime))
          @event.save
      end    
      format.js
    end
 end
  
  #Elimina eventos y ejecuta es JS de destroy.js.erb
  def destroy
    @event = Evento.find_by_id(params[:id])
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
      format.js
    end

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
  
  