AspenVersion3::Application.routes.draw do
  
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
  
  


  resources :agendas
  resources :usuarios
  resources :usuario_sessions
  
  match 'home' => 'usuarios#new', as: :home
  match 'login'  => 'usuarios#new', as: :login
  match 'logout' => 'usuario_sessions#destroy', as: :logout

  match '/usuarios/new' => 'usuarios#new', as: :nuevoUsuario
  match '/usuarios/:id' => 'usuarios#index', as: :listaUsuarios
  match '/usuarios/:id/edit' => 'usuarios#edit', as: :editarUsuario

  match '/participantes/new/:id' => 'participantes#new', as: :nuevoParticipante
  match '/participantes/:id' => 'participantes#index', as: :listaParticipantes
  match '/participantes/:id/edit' => 'participantes#edit', as: :editarParticipantes

  match '/contratos/new/:id' => 'contratos#new', as: :nuevoContrato
  match '/contratos/:id' => 'contratos#index', as: :listaContratos
  match '/contratos/:id/edit' => 'contratos#edit', as: :editarContrato

  match '/actividads/new/:id' => 'actividads#new', as: :nuevaActividad
  match '/actividads/:id' => 'actividads#index', as: :listaActividads
  match '/actividads/:id/edit' => 'actividads#edit', as: :editarActividad
  
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

  #filtrado de actividades
  match 'actividads/filtrado/:proceso_id/:estado_id' => 'actividads#filtrado'


end
