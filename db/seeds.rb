require 'open-uri'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Tablas parametricas - Estado Actividad
["sinIniciar", "abiertos", "cerrados", "aplazados", "vencieron Terminos"].each do |estado|
  EstadoProceso.create(:estado => estado)
end

#Tablas parametricas - Estado proceso
["Programadas", "Abiertas", "Atrasadas", "Terminadas"].each do |estado|
  EstadoActividad.create(:estado => estado)
end
#Tablas parametricas - privilegio
["Administrador","Colaborador"].each do |privilegio|
  Privilegio.create(:descripcion => privilegio)
end

#Tablas parametricas - Rol Participante
["Ingeniero Sistemas"].each do |rol|
  RolParticipante.create(:rol => rol)
end

TipoProceso.delete_all
#Tablas parametricas - Tipo proceso
open("#{Rails.root}/test/initdata/tipoProcesos.txt") do |tipoproceso|
  tipoproceso.read.each_line do |data|
    code, tipo = data.chomp.split("|")
    TipoProceso.create!(:tipo => tipo)
  end
end

