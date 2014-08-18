class Abogado < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  #atributo para la foto del perfil
  has_attached_file :foto
  validates_attachment_size :foto, :less_than => 5.megabytes
  validates_attachment_content_type :foto, :content_type => %w(image/jpeg image/jpg image/png )
  #has_attached_file :foto, :styles => { :medium => "64x64>", :tiny => "32x32>" }
  has_attached_file :foto

  # Setup accessible (or protected) attributes for your model
  attr_accessible :foto, :email, :password, :password_confirmation, :remember_me, :created_at,:updated_at,:last_sign_in_at, :nombre, :empresa
  # attr_accessible :title, :body

  after_create :welcome_message

   #Un Usuario (Abogado) tiene varios procesos
  has_many :control_accesos
  has_many :procesos, through: :control_accesos

  #A adjuntado varios documentos
  has_many :documents
  #Un Usuario (Abogado) tiene varios eventos al cual puede estar asociado
  has_many :usuario_eventos
  has_many :eventos, through: :usuario_eventos


  #Relacion Un Despacho tiene (has_many)  varios abogados
  has_many :abogados , class_name: "Usuario", foreign_key: "despacho_id"
 
  #Relacion un usuario(abogado) pertenece a un despacho.
  belongs_to :despacho, class_name: "Usuario"
  
  #relacion superUsuario tiene varios Tipos de proceso y proceso
  #has_many :tipo_procesos
  #has_many :procesos, through: :tipo_procesos

  #relacion de alertas por usuario, traer todas las alertas de un unico usuario
  has_many :alertas
  has_many :alertas, through: :control_accesos, through: :procesos

  #realcion de actividades por usuario, traer todas las actividades de un unico usuario
  has_many :actividads
  has_many :actividads, through: :control_accesos, through: :procesos

   #realcion de participantes, traer todos los particpantes de un unico usuario
  has_many :participantes
  has_many :participantes, through: :control_accesos, through: :procesos

  #invitaciones que hace el usuario (abogado)
  has_many :invitacions
  #grupo de colegas
  has_many :colegas

  #generacion de token para funcion remember me
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while Usuario.exists?(column => self[column])
  end  

  #Scope para la tabla
  scope :activos, where(:activo => true)
  
  #ultimo proceso creado
  def self.ultimoProcesoCreado
      where("procesos.activo = ? LIMIT 1", true)
  end

  def self.buscarAbogado (id)
        where("id = ? ", id)
  end

  def self.buscarAbogadoMail (mail)
        where("email LIKE ? LIMIT 1", mail)
  end


  def enviarContacto
    
  end

    # devise confirm! method overriden
  def confirm!
    welcome_message
    super
  end

private

  def welcome_message
    UsuarioMails.bienvenida(self).deliver
  end
end
