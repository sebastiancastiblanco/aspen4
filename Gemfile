source 'https://rubygems.org'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :production do
  gem 'pg'
end

group :development do
  gem 'sqlite3'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
  gem 'railroady' , '~> 1.1.1'# para la generacion de diagramas
  #Gema para adicionar CSS sinamivamente al HTML que se envia en los emails.
  gem 'roadie'
end

gem 'paperclip'
gem 'devise'
gem "date-input-rails"
gem "chartkick" #Gema para los reportes graficos
gem 'groupdate' # Para agrupacion de fechs por dia,semana, horas



# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
  gem 'compass-rails'
  gem 'zurb-foundation', '~> 4.0.4'

  #Datatable Jquery
  gem 'jquery-datatables-rails', github: 'rweng/jquery-datatables-rails'

end

gem 'jquery-rails', '~> 2.3.0'

#Gemas para loggin
gem 'sorcery'

#Gem gon, para usar las variables del controlador en codigo javascript
gem "gon", "~> 4.1.1"

#GEmma para el calendario
#gem 'fullcalendar-rails'



#Gemma de autocompletado
gem "rails3-jquery-autocomplete", "~> 1.0.11"
#Gema para el datepicker
gem 'jquery-timepicker-rails'

#Gema para tareas programadas
gem 'whenever', :require => false

#delayed para enviar correos asincronamente
gem 'delayed_job_active_record'

#Autocompletar los campos
gem 'rails4-autocomplete', '~> 1.0.7'

#imagemagick gem para subir imagenes y modificarlas
#gem 'rmagick'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
