AspenVersion3::Application.routes.draw do
  
  resources :contrasena_resets  

  resources :logs
  get "logs/iractividad"

  resources :events
  get "events/move"
  get "events/resize"
  

  resources :tipo_procesos
  get "tipo_procesos/create"

  resources :actividads
  get "actividads/filtrado"

  resources :estado_actividads
  resources :contratos
  resources :participantes
 

  resources :rol_participantes
  resources :control_accesos
  get "procesos/createTipoProceso"

  resources :procesos
  get "procesos/favorito"
  get "procesos/nofavorito"
  get "procesos/compartirProceso"
  get "procesos/eventos"
  
  
  resources :agendas
  resources :usuarios
  resources :usuario_sessions
  
  
  match 'progreso' => 'logs#index', as: :progreso
  match 'funcionalidades' => 'usuarios#funcionalidades', as: :funcionalidades
  match 'precios' => 'usuarios#planprecios', as: :precios
  match 'ingresoCuenta' => 'usuarios#login', as: :ingresoCuenta
  match 'recuperarContrasena' => 'usuarios#recuperarContresena', as: :recuperarContresena


  match 'home' => 'usuarios#new', as: :home
  match 'login'  => 'usuarios#new', as: :login
  match 'logout' => 'usuario_sessions#destroy', as: :logout

  match '/usuarios/new' => 'usuarios#new', as: :nuevoUsuario
  match '/usuarios/:id' => 'usuarios#index', as: :listaUsuarios
  match '/usuarios/:id/edit' => 'usuarios#edit', as: :editarUsuario

  match '/participantes/:id/edit' => 'participantes#edit', as: :editParticipante
  match '/procesos/:proceso_id/participantes/new/:id' => 'participantes#new', as: :nuevaActividad
  match '/procesos/:proceso_id/participantes/:participante_id/:nuevoItem' => 'participantes#index', as: :editarParticipantesProceso
  match '/procesos/:proceso_id/participantes/:nuevoItem' => 'participantes#index', as: :nuevoParticipantesProceso
  match '/procesos/:proceso_id/participantes' => 'participantes#index', as: :verParticipantesProceso
  

  match '/contratos/:id/edit' => 'contratos#edit', as: :editContrato
  match '/procesos/:proceso_id/contratos/new/:id' => 'contratos#new', as: :nuevaActividad
  match '/procesos/:proceso_id/contratos/:contrato_id/:nuevoItem' => 'contratos#index', as: :editarContratosProceso
  match '/procesos/:proceso_id/contratos/:nuevoItem' => 'contratos#index', as: :nuevoContratosProceso
  match '/procesos/:proceso_id/contratos' => 'contratos#index', as: :verContratosProceso
  
  match '/actividads/:id/edit' => 'actividads#edit', as: :editActividad
  match '/procesos/:proceso_id/actividades/new/:id' => 'actividads#new', as: :nuevaActividad
  match '/procesos/:proceso_id/actividades/:actividad_id/:nuevoItem' => 'actividads#index', as: :editarActividadesProceso
  match '/procesos/:proceso_id/actividades/:nuevoItem' => 'actividads#index', as: :nuevoActividadesProceso
  match '/procesos/:proceso_id/actividades' => 'actividads#index', as: :verActividadesProceso
  
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
   root :to => 'usuarios#new'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'

  
  match 'procesos/createTipoProceso' => 'tipo_procesos#createTipoProceso'
  match 'procesos/compartirProceso' => 'control_accesos#compartirProceso'
  match 'procesos/favorito/:procesoid' => 'procesos#favorito'
  match 'procesos/cantidadUsuarios/:procesoid' => 'procesos#cantidadUsuarios'
  match 'procesos/nofavorito/:procesoid' => 'procesos#nofavorito'
  match 'tipo_procesos/create/' => 'tipo_procesos#create'
  match '/procesos/:proceso_id/eventos' => 'procesos#eventos', as: :verEventosProceso

  match 'procesos/estadoProceso/:procesoid/:estadoProcesoid' => 'procesos#estadoProceso'

  #Agenda
  match '/events/move/:id' => 'events#move'
  match '/events/resize/:id' => 'events#resize'

  #filtrado de actividades
  match 'actividads/filtrado/:proceso_id/:estado_id' => 'actividads#filtrado'

  #ir actividad desde el log
  match '/logs/iractividad/:log_id' => 'logs#iractividad'

end
