class EventsController < ApplicationController
  
  #Recupara la lista de eventos del usuario.
  def index
    @event = Event.new
    #Recuperar los eventos del usuario logeado
    @events = current_user.events
    #respond de la funcion
    respond_to do |format| 
      format.html # index.html.erb 
      format.json { render :json => @events } 
     end 
  end

  # Crea la instancia del evento a crear en el la plantilla _form.html.erb
  def new
    @event = Event.new
    if (params[:date])
        @event.starttime = params[:date]
        @event.endtime = params[:date]
    end
  end
  
  #crea el evento en el calendario,  ejecuta el archivo create.js.erb
  #Asociandolo al usuario que lo creo.
  def create
      @event = Event.new(params[:event])
      respond_to do |format|
        if @event.save
          #Salvar relacion entre el evento y el usuario que lo creo
          @event.usuario_eventos.create(:usuario_id => current_user.id,:propietario_id => current_user.id,:event_id => @event.id)
        
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
    @event = Event.find_by_id(params[:id])
     
  end
  
  #actualiza los eventos y ejecuta update.js.erb
  def update
      @event = Event.find_by_id(params[:idEvent])
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
      @event = Event.find(params[:id])
    if @event
      @event.starttime = (params[:minute_delta].to_i).minutes.from_now((params[:day_delta].to_i).days.from_now(@event.starttime))
      @event.endtime = (params[:minute_delta].to_i).minutes.from_now((params[:day_delta].to_i).days.from_now(@event.endtime))
      @event.all_day = params[:all_day]
      @event.save
    end
  end
  
  #redimensaiona los eventos y ejecuta es JS de resize.js.erb
  def resize
    @event = Event.find(params[:id])
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
    @event = Event.find_by_id(params[:id])
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
    @events = Event.all 
    events = [] 
    @events.each do |event|
      events << {:id => event.id, :title => event.title, :description => event.description || "Some cool description here...", :start => "#{event.starttime.iso8601}", :end => "#{event.endtime.iso8601}", :allDay => event.all_day, :recurring => (event.event_series_id)? true: false}
    end
    render :text => events.to_json
  end
  
  