class Proceso < ActiveRecord::Base
  attr_accessible :ciudad, :favorito, :objetivo, :procesoHomologado, :referencia, :resumen, :titulo,:updated_at,:tipo_proceso_id,:estado_proceso_id

  #Validaciones de título
  validates :titulo, :objetivo, :ciudad, :presence => { :message => "Campo obligatorio"}

  #Procesos a los cuales se tiene acceso
  has_many :control_accesos
  has_many :usuarios, through: :control_accesos

  #participantes del proceso
  has_many :participantes

  #tiene varios contratos
  has_many :contratos
  #tiene varias actviidades
  has_many :actividads

 #tiene varias alertas
  has_many :alertas

   #tiene varios documentos
  has_many :documents

   #tiene varios estados
  has_many :estados

  #tiene un tipo de proceso
  belongs_to :tipo_proceso
  #tiene un estado de proceso
  belongs_to :estado_proceso

  scope :activos, where(activo: true)

  #Metodo propio del proceso, filtro de procesos por usuario y estado del proceso
  def self.procesoEstado(usuarioid,estado_proceso_id)
    where("usuario_id = ? AND estado_proceso_id = ?", usuarioid,estado_proceso_id)
  end
  scope :sinIniciar, ->(usuarioid) {self.procesoEstado(usuarioid,1)}
  scope :abiertos, ->(usuarioid) {self.procesoEstado(usuarioid,2)}
  scope :terminados, ->(usuarioid) {self.procesoEstado(usuarioid,4)}
  scope :aplazados, ->(usuarioid) {self.procesoEstado(usuarioid,3)}
  
  def self.search(search)
    if search
      find(:all, :conditions => ['titulo LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end



end
