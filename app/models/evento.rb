class Evento < ActiveRecord::Base
  attr_accessible :allDay, :className, :color, :end, :start, :title, :url,:dsecription,:alerta_id
  #validaciones campos obligatorios
  validates :start, :title,:end, :presence => { :message => "Campo obligatorio"}

   has_many :usuario_eventos
   has_many :usuarios, through: :usuario_eventos

   has_one :alerta
    

end
