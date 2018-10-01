class LoginController < ApplicationController
  skip_before_action :require_login, only: [:create, :iniciar_session, :crear_cuenta, :login]

  def login
  end

  def create
    login = Login.find_by(username: login_params[:username])
    cem = Cem.first
    perfil = Perfil.find_by(nombre: 'CEM')
    return redirect_to '/crear_cuenta?alert=cuenta_ya_existe' if login.present?

    login = Login.create!(username: login_params[:username], password: login_params[:password], actor_id: cem.id,  nombre_tabla_actor: cem.class.name, perfil_id: perfil.id)
    session[:logged_user] = login
    session[:perfil] = login.perfil.nombre
    return redirect_to '/?alert=cuenta_creada'
  end

  def iniciar_sesion
    login = Login.find_by(username: login_params[:username], password: login_params[:password])
    perfil = Perfil.find_by(id: login_params[:perfil_id])
    perfil_incorrecto = perfil.blank? || (login&.perfil&.nombre != perfil.nombre)

    return redirect_to '/login?alert=login_incorrecto' if login.blank?
    return redirect_to '/login?alert=perfil_incorrecto' if perfil_incorrecto

    session[:logged_user] = login
    session[:perfil] = login.perfil.nombre
    return redirect_to '/?alert=login_correcto'
  end

  def login_params
    params.require(:login).permit(:email, :password, :username, :perfil_id)
  end

  def logout
    session[:logged_user] = nil
    return redirect_to '/login?alert=sesion_terminada'
  end
end
