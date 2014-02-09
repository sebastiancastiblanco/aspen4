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

ActiveRecord::Schema.define(:version => 20140209212721) do

  create_table "abogados", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "abogados", ["email"], :name => "index_abogados_on_email", :unique => true
  add_index "abogados", ["reset_password_token"], :name => "index_abogados_on_reset_password_token", :unique => true

  create_table "actividad_eventos", :force => true do |t|
    t.integer  "usuario_id"
    t.integer  "actividad_id"
    t.datetime "fecha"
    t.integer  "tiempo"
    t.string   "descripcion"
    t.string   "medidaTiempo"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "abogado_id"
  end

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
    t.boolean  "notificarMail"
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
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "proceso_id"
    t.boolean  "activo"
    t.datetime "horainicio"
    t.boolean  "notificarMail"
    t.integer  "abogado_id"
  end

  create_table "brands", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "clientes", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "clientes", ["email"], :name => "index_clientes_on_email", :unique => true
  add_index "clientes", ["reset_password_token"], :name => "index_clientes_on_reset_password_token", :unique => true

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
    t.integer  "privilegio_id"
    t.integer  "abogado_id"
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
    t.integer  "usuario_id"
    t.boolean  "activo"
    t.integer  "abogado_id"
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
    t.boolean  "activo"
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

  create_table "eventos", :force => true do |t|
    t.string   "title"
    t.string   "dsecription"
    t.boolean  "allDay"
    t.datetime "start"
    t.datetime "end"
    t.string   "url"
    t.string   "className"
    t.string   "color"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "alerta_id"
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
    t.datetime "horainicio"
    t.datetime "horafin"
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
    t.integer  "abogado_id"
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
    t.boolean  "rolPrincipal"
  end

  create_table "privilegios", :force => true do |t|
    t.string   "descripcion"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "proceso_participantes", :force => true do |t|
    t.integer  "participante_id"
    t.integer  "proceso_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "procesos", :force => true do |t|
    t.string   "referencia"
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
    t.boolean  "activo"
    t.integer  "abogado_id"
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

  create_table "software_abogados", :force => true do |t|
    t.string   "correo"
    t.string   "nombre"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tipo_procesos", :force => true do |t|
    t.string   "tipo"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "usuario_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "usuario_eventos", :force => true do |t|
    t.integer  "usuario_id"
    t.integer  "event_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "propietario_id"
    t.integer  "evento_id"
  end

  create_table "usuarios", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "despacho_id"
    t.string   "empresa"
    t.string   "nombre"
    t.string   "authToken"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "usuarios", ["email"], :name => "index_usuarios_on_email", :unique => true
  add_index "usuarios", ["reset_password_token"], :name => "index_usuarios_on_reset_password_token", :unique => true

end
