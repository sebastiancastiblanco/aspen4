class Usuario < ActiveRecord::Base
  
  authenticates_with_sorcery!
  before_create {generate_token(:authToken)}

  #Atributos accesibles por la vista
  attr_accessible :username,:nombre, :email, :password, :password_confirmation, :despacho_id, :empresa , :created_at, :updated_at, :updated_at, :password_reset_token, :password_reset_sent_at
  
  #Validaciones
  validates :empresa, :username,:nombre,:password,:password_confirmation, :presence => { :message => "Campo obligatorio"}

  #Validacion de password 
  validates_confirmation_of :password, message: "Ambos campos deben coincidir"

  #Un Usuario (Abogado) tiene varios procesos
  has_many :control_accesos
  has_many :procesos, through: :control_accesos

  #A adjuntado varios documentos
  has_many :documents
  #Un Usuario (Abogado) tiene varios eventos al cual puede estar asociado
  has_many :usuario_eventos
  has_many :events, through: :usuario_eventos


  #Relacion Un Despacho tiene (has_many)  varios abogados
  has_many :abogados , class_name: "Usuario", foreign_key: "despacho_id"
 
  #Relacion un usuario(abogado) pertenece a un despacho.
  belongs_to :despacho, class_name: "Usuario"
  
  #relacion superUsuario tiene varios Tipos de proceso y proceso
  has_many :tipo_procesos
  has_many :procesos, through: :tipo_procesos

  #generacion de token para funcion remember me
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while Usuario.exists?(column => self[column])
  end  

  def send_reset_pass
    generate_token(:password_reset_token)
    self.password_confirmation = "a"
    self.password = "a"
    self.password_reset_sent_at = Time.zone.now
    save!
    UsuarioMails.recuperarContrasena(self).deliver
  end

  

end
