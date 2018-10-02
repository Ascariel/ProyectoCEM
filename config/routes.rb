Rails.application.routes.draw do
  get 'programa_estudio/index'
  get 'programa_estudio/new'
  get 'home', to: 'home#index'
  root 'home#index'
  # get 'login/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/login', to: 'login#login'
  get '/iniciar_sesion', to: 'login#login'
  post '/iniciar_sesion', to: 'login#iniciar_sesion'

  get '/crear_cuenta', to: 'login#crear_cuenta'
  post '/crear_cuenta', to: 'login#create'

  delete '/logout', to: 'login#logout'
  get '/logout', to: 'login#logout'

  resource :programa_estudio, controller: 'programa_estudio'
end
