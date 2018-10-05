Rails.application.routes.draw do


  get 'familias/index'
  # Home/Index es un placeholder que muestra todos los programas sin requerir login
  # get 'home', to: 'home#index'
  root 'home#index'

  get '/login', to: 'login#login'
  get '/iniciar_sesion', to: 'login#login'
  # Guarda la sesion y el estado logueado
  post '/iniciar_sesion', to: 'login#iniciar_sesion'

  get '/crear_cuenta', to: 'login#crear_cuenta'
  post '/crear_cuenta', to: 'login#create'

  delete '/logout', to: 'login#logout'
  get '/logout', to: 'login#logout'

  post '/postulacion_cel_programa', to: 'programas_cel#create'
  post '/eliminar_cel_programa', to: 'programas_cel#destroy'
  get '/programas_cel', to: 'programas_cel#index'

  get '/cels/postulaciones_familias', to: 'cels#postulaciones_familias'
  post '/cels/postulacion_familia_cel', to: 'cels#postulacion_familia_cel'
  post '/cels/eliminar_postulacion_familia_cel', to: 'cels#eliminar_postulacion_familia_cel'

  get 'familias/:id/postulacion_familia_cel', to: 'familias#postulacion_familia_cel'


  resources :programas_estudio
  resources :programas_cel
  resources :alumnos
  resources :cels
  resources :familias
  # resources :programa_cels
  # resources :photos
end
