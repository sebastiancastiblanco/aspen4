AspenVersion3::Application.routes.draw do
  get "buscar_procesos/buscarProceso"

  get "buscar_procesos/busquedaInicial"

  resources :actividad_eventos


  resources :reportes
  get "reportes/index"
  get "reportes/reporteProceso"

  resources :software_abogados
  resources :contrasena_resets  
  resources :logs
  get "logs/iractividad"

  resources :documents
  
  resources :eventos
  get "eventos/move"
  get "eventos/resize"
  
  resources :tipo_procesos
  get "tipo_procesos/create"
  
  resources :actividads
  get "actividads/filtrado"
  get "actividads/nuevoRegistro"

  
  resources :estado_actividads
  resources :contratos
  resources :participantes
  resources :alertas
  resources :estados
  resources :rol_participantes
  
  resources :control_accesos
  get "procesos/createTipoProceso"
  

  

  resources :procesos
  get "procesos/favorito"
  get "procesos/nofavorito"
  get "procesos/compartirProceso"
  get "procesos/eventos"
  get "procesos/favoritos"
  get "procesos/buscarProceso"
  
  resources :agendas
  resources :usuarios
  
  resources :usuarios do
    get :autocomplete_usuario_name, :on => :collection
  end
 
  
  resources :usuario_sessions

  
  match 'progreso' => 'logs#index', as: :progreso
  match 'compartirProcesos' => 'control_accesos#index', as: :compartirProcesos
  match 'funcionalidades' => 'usuarios#funcionalidades', as: :funcionalidades
  match 'precios' => 'usuarios#planprecios', as: :precios
  match 'ingresoCuenta' => 'usuarios#login', as: :ingresoCuenta
  match 'recuperarContrasena' => 'usuarios#recuperarContresena', as: :recuperarContresena

  match 'alertasPendientes' => 'alertas#alertasPendientes', as: :alertasPendientes
  match 'actividadesPendientes' => 'actividads#actividadesPendientes', as: :actividadesPendientes

  match 'home' => 'usuarios#new', as: :home
  match 'login'  => 'usuarios#new', as: :login
  match 'logout' => 'usuario_sessions#destroy', as: :logout

  match '/usuarios/new' => 'usuarios#new', as: :nuevoUsuario
  match '/usuarios/:id' => 'usuarios#index', as: :listaUsuarios
  match '/usuarios/:id/edit' => 'usuarios#edit', as: :editarUsuario

  match '/proceso/:proceso_id/participantes/edit/:id' => 'participantes#edit', as: :editParticipante
  match '/proceso/:proceso_id/participantes/edit/:id/:nuevoItem' => 'participantes#edit', as: :editParticipante
  
  match '/proceso/:proceso_id/participantes/new' => 'participantes#new', as: :nuevaActividad
  match '/proceso/:proceso_id/participantes/:participante_id/:nuevoItem' => 'participantes#index', as: :editarParticipantesProceso
  match '/proceso/:proceso_id/participantes/:nuevoItem' => 'participantes#index', as: :nuevoParticipantesProceso
  match '/proceso/:proceso_id/participantes' => 'participantes#index', as: :listaParticipantes
  match '/proceso/:proceso_id/participantes/:id' => 'participantes#index', as: :ParticipanteProceso

  match '/contratos/:id/edit' => 'contratos#edit', as: :editContrato
  match '/proceso/:proceso_id/contratos/new/:id' => 'contratos#new', as: :nuevaActividad
  match '/proceso/:proceso_id/contratos/:contrato_id/:nuevoItem' => 'contratos#index', as: :editarContratosProceso
  match '/proceso/:proceso_id/contratos/:nuevoItem' => 'contratos#index', as: :nuevoContratosProceso
  match '/proceso/:proceso_id/contratos' => 'contratos#index', as: :verContratosProceso
  
  
  match '/actividads/:id/edit' => 'actividads#edit', as: :editActividad
  match '/proceso/:proceso_id/actividades/new/:id' => 'actividads#new', as: :nuevaActividad
  match '/proceso/:proceso_id/actividades/:actividad_id/:nuevoItem' => 'actividads#index', as: :editarActividadesProceso
  match '/proceso/:proceso_id/actividades/:nuevoItem' => 'actividads#index', as: :nuevoActividadesProceso
  match '/proceso/:proceso_id/actividades' => 'actividads#index', as: :verActividadesProceso


  match '/alertas/:alerta_id/edit' => 'alertas#edit', as: :editarActividad
  match '/proceso/:proceso_id/alertas' => 'alertas#index', as: :listaAlertas
  match '/proceso/:proceso_id/alertas/nuevo' => 'alertas#new', as: :nuevaAlerta
  match '/proceso/:proceso_id/alertas/:alerta_id/edit' => 'alertas#edit', as: :editarActividad

  match '/documents/:documento_id/edit' => 'documents#edit', as: :editarDocumento
  match '/proceso/:proceso_id/documents' => 'documents#index', as: :listaDocumentos
  match '/proceso/:proceso_id/documents/new' => 'documents#new', as: :nuevaDocumento, :via => :post
  match '/proceso/:proceso_id/documents/:documento_id/edit' => 'documents#edit', as: :editarDocumento

  match '/estados/:estado_id/edit' => 'estados#edit', as: :editarEstado
  match '/proceso/:proceso_id/conclusiones' => 'estados#index', as: :listaEstados
  match '/proceso/:proceso_id/conclusiones/new' => 'estados#new', as: :nuevoEstado, :via => :post
  match '/proceso/:proceso_id/conclusiones/:estado_id/edit' => 'estados#edit', as: :editarEstado

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

  match '/reportes/reporteProceso/:proceso_id' => 'reportes#reporteProceso'
  

  #Agenda
  match '/eventos/move/:id' => 'eventos#move'
  match '/eventos/resize/:id' => 'eventos#resize'

  #filtrado de actividades
  match 'actividads/filtrado/:proceso_id/:estado_id' => 'actividads#filtrado'

  #ir actividad desde el log
  match '/logs/iractividad/:log_id' => 'logs#iractividad'

  #Buscar procesos
  match '/procesos/searchProceso/' => 'procesos#searchProceso'
  
  #filtrado de procesos favoritos
  match 'procesos/favoritos/:estado' => 'procesos#favoritos'
  #buscar procesos con filtros
   match 'procesos/buscarProceso' => 'procesos#buscarProceso'


  match 'actividads/nuevoregistro/:actividad_id' => 'actividads#nuevoRegistro'

end
