AplicacionMedica::Application.routes.draw do

  devise_for :users,:controllers => { :registrations =>'registration'}

  get 'about',   to: 'home#about',  as: 'about' 
  get 'dashboard' => 'home#dashboard'

  root :to =>'home#index'

  #Modulo atencion salud
  resources :atenciones_salud
  post '/agregar_examen', to: 'persona_examen#agregarExamen', :as => :agregarExamen
  post '/eliminar_examen', to: 'persona_examen#eliminarExamen', :as => :eliminarExamen
  post '/agregar_diagnostico', to: 'persona_diagnostico#agregarDiagnostico', :as => :agregarDiagnostico
  post '/crear_atencion', to: 'atenciones_salud#crearAtencion'
  post '/editar_atencion', to: 'atenciones_salud#editarAtencion'
  post '/eliminar_diagnostico', to: 'persona_diagnostico#eliminarDiagnostico', :as => :eliminarDiagnostico
  post '/guardar_diagnostico', to: 'persona_diagnostico#guardarDiagnostico', :as => :guardarDiagnostico
  
  #Modulo agendamiento
  # get '/agendamiento/agendaCompleta/:prestador_id/:profesional_id', to: 'agendamiento#showAgenda', :as => :agenda_show_all
  post '/agendamiento/agregarHora', to: 'agendamiento#new'
  get '/agendamiento/buscarHora', to: 'agendamiento#showFormBusqueda', :as => :agendaShowFormBusqueda
  get '/agendamiento/pedirHora/:especialidad_id/:prestador_id/:profesional_id', to: 'agendamiento#pedirHora'
  put '/agendamiento/pedirHora', to: 'agendamiento#pedirHora', :as => :pedirHora #Esta es solo para ponerle un nombre a la anterior pero sin parámtros
  get '/agendamiento/buscadorHora', to: 'agendamiento#buscadorHora', :as => :agendamientoBuscadorHora
  post '/cargarTodos', to: 'agendamiento#cargarTodos', :as => :agendamientoCargarTodos
  post '/filtrar_profesionales', to: 'agendamiento#filtrarProfesionales', :as => :filtrarProfesionales
  post '/buscar_horas', to: 'agendamiento#buscarHoras', :as => :buscarHoras
  # get '/agendamiento/agregarHora/:prestador_id', to: 'agendamiento#agregarHoraS1', :as => :agregar_hora_s1
  # get '/agendamiento/agregarHora/:prestador_id/:profesional_id', to: 'agendamiento#agregarHoraS2', :as => :agregar_hora_s2


  post '/aux/formNuevaHora', to: 'agendamiento#agregarNuevaHora', :as => :agregarHora
  post '/aux/mostrarEventos', to: 'agendamiento#mostrarEventos', :as => :showEventos
  post '/aux/detalleEvento', to: 'agendamiento#detalleEvento', :as => :detalleEvento
  post '/aux/pedirHoraEvento', to: 'agendamiento#pedirHoraEvento', :as => :pedirHoraEvento
  post '/aux/cancelarHora', to: 'agendamiento#cancelarHora', :as => :cancelarHora
  post '/aux/confirmarHora', to: 'agendamiento#confirmarHora', :as => :confirmarHora
  post '/aux/bloquearHora', to: 'agendamiento#bloquearHora', :as => :bloquearHora
  post '/aux/marcarLlegada', to: 'agendamiento#marcarLlegada', :as => :marcarLlegada
  post '/aux/buscarHoraFormActualizar', to:'agendamiento#showFormBusquedaActualizar', :as => :agendaShowFormBusquedaRefresh

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
