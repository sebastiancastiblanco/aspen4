class Evento < ActiveRecord::Base
  attr_accessible :allDay, :className, :color, :end, :start, :title, :url,:dsecription,:alerta_id,:event_id,:usuario_id,:abogado_id
  #validaciones campos obligatorios
  #validates :title, :presence => { :message => "Campo obligatorio"}

   has_many :usuario_eventos
   has_many :abogados, through: :usuario_eventos

   has_one :alerta
    

end
