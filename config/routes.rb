Rails.application.routes.draw do


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

  resources :programas_estudio
  resources :programa_cels
  # resources :photos
end
