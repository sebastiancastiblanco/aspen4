# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130928142158) do

  create_table "actividads", :force => true do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.string   "observacion"
    t.date     "fechaSeguimiento"
    t.integer  "tiempoEjecucion"
    t.string   "medidaTiempo"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "estado_actividad_id"
    t.integer  "proceso_id"
    t.integer  "participante_id"
    t.boolean  "activo"
  end

  create_table "agendas", :force => true do |t|
    t.string   "titulo"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "alerta", :force => true do |t|
    t.string   "titulo"
    t.string   "hora"
    t.string   "nota"
    t.datetime "comienza"
    t.datetime "termina"
    t.integer  "repeticion"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "proceso_id"
  end

  create_table "contratos", :force => true do |t|
    t.string   "tipoContrato"
    t.string   "objeto"
    t.integer  "particpante1"
    t.integer  "participante2"
    t.float    "valor"
    t.string   "formaPago"
    t.string   "obligaciones"
    t.string   "deberes"
    t.date     "fechaInicio"
    t.date     "fechaFin"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "proceso_id"
    t.boolean  "activo"
  end

  create_table "control_accesos", :force => true do |t|
    t.integer  "controlAcceso_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "proceso_id"
    t.integer  "usuario_id"
  end

  create_table "documents", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.integer  "proceso_id"
  end

  create_table "estado_actividads", :force => true do |t|
    t.string   "estado"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "estado_procesos", :force => true do |t|
    t.string   "estado"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "estados", :force => true do |t|
    t.string   "tipo"
    t.date     "fecha"
    t.string   "resumen"
    t.string   "conclusion"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "proceso_id"
  end

  create_table "event_series", :force => true do |t|
    t.integer  "frequency",  :default => 1
    t.string   "period",     :default => "monthly"
    t.datetime "starttime"
    t.datetime "endtime"
    t.boolean  "all_day",    :default => false
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  create_table "events", :force => true do |t|
    t.string   "title"
    t.datetime "starttime"
    t.datetime "endtime"
    t.boolean  "all_day",         :default => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.text     "description"
    t.integer  "event_series_id"
  end

  add_index "events", ["event_series_id"], :name => "index_events_on_event_series_id"

  create_table "logs", :force => true do |t|
    t.integer  "usuario_id"
    t.integer  "proceso_id"
    t.integer  "participante_id"
    t.integer  "contrato_id"
    t.integer  "actividad_id"
    t.integer  "alertas_id"
    t.integer  "estado_id"
    t.integer  "documento_id"
    t.string   "mensaje"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "mensaje_id"
    t.string   "usuario"
    t.string   "proceso"
  end

  create_table "participantes", :force => true do |t|
    t.string   "tipoDocumento"
    t.integer  "documento"
    t.string   "nombre"
    t.string   "apellido"
    t.string   "estadoCivil"
    t.string   "genero"
    t.string   "direccion"
    t.integer  "telefono"
    t.integer  "celular"
    t.string   "correo"
    t.date     "fechaNacimiento"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "rol_participante_id"
    t.integer  "proceso_id"
    t.boolean  "activo"
  end

  create_table "proceso_participantes", :force => true do |t|
    t.integer  "participante_id"
    t.integer  "proceso_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "procesos", :force => true do |t|
    t.float    "referencia"
    t.float    "procesoHomologado"
    t.string   "resumen"
    t.string   "ciudad"
    t.string   "objetivo"
    t.string   "titulo"
    t.boolean  "favorito"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "usuario_id"
    t.integer  "tipo_proceso_id"
    t.integer  "estado_proceso_id"
  end

  add_index "procesos", ["usuario_id"], :name => "index_procesos_on_usuario_id"

  create_table "rol_participantes", :force => true do |t|
    t.string   "rol"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles_participantes", :force => true do |t|
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "participante_id"
    t.integer  "rolParticipante_id"
  end

  create_table "tipo_procesos", :force => true do |t|
    t.string   "tipo"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "usuario_id"
  end

  create_table "usuario_eventos", :force => true do |t|
    t.integer  "usuario_id"
    t.integer  "event_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "propietario_id"
  end

  create_table "usuarios", :force => true do |t|
    t.string   "username",               :null => false
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.integer  "despacho_id"
    t.string   "empresa"
    t.string   "nombre"
    t.string   "authToken"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
  end

end
