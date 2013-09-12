class LogController < ApplicationController

 def index
    @event = Log.new
    
    #respond de la funcion
    respond_to do |format| 
      format.html # index.html.erb 
     end 
  end

end
