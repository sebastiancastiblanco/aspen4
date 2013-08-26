class EventsController < ApplicationController
  
  def index
    @events = Event.scoped 
    @event = Event.new
    @events = Event.all 
    respond_to do |format| 
      format.html # index.html.erb 
      format.json { render :json => @events } 
     end 
  end

  def new
    @event = Event.new
  end
  

  def show

  end

  def create
      @event = Event.new(params[:event])
      respond_to do |format|
        if @event.save
            format.json { render json: @event, status: :created, location: @event }
            format.js
        else
            format.json { render json: @event.errors, status: :unprocessable_entity }
            format.js
        end
      end
    
 end
  
  def edit
    @event = Event.find_by_id(params[:id])
     
  end
  
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


  def move
      @event = Event.find(params[:id])
    if @event
      @event.starttime = (params[:minute_delta].to_i).minutes.from_now((params[:day_delta].to_i).days.from_now(@event.starttime))
      @event.endtime = (params[:minute_delta].to_i).minutes.from_now((params[:day_delta].to_i).days.from_now(@event.endtime))
      @event.all_day = params[:all_day]
      @event.save
    end
  end
  
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
  


  def get_events
    #@events = Event.find(:all, :conditions => ["starttime >= '#{Time.at(params['start'].to_i).to_formatted_s(:db)}' and endtime <= '#{Time.at(params['end'].to_i).to_formatted_s(:db)}'"] )
    @events = Event.all 
    events = [] 
    @events.each do |event|
      events << {:id => event.id, :title => event.title, :description => event.description || "Some cool description here...", :start => "#{event.starttime.iso8601}", :end => "#{event.endtime.iso8601}", :allDay => event.all_day, :recurring => (event.event_series_id)? true: false}
    end
    render :text => events.to_json
  end
  
  
  
  
  

  
  def destroy
    @event = Event.find_by_id(params[:id])
    if params[:delete_all] == 'true'
      @event.event_series.destroy
    elsif params[:delete_all] == 'future'
      @events = @event.event_series.events.find(:all, :conditions => ["starttime > '#{@event.starttime.to_formatted_s(:db)}' "])
      @event.event_series.events.delete(@events)
    else
      @event.destroy
    end
    
    render :update do |page|
      page<<"$('#calendar').fullCalendar( 'refetchEvents' )"
      page<<"$('#desc_dialog').dialog('destroy')" 
    end
    
  end
  
end