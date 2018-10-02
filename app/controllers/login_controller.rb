class LoginController < ApplicationController
  skip_before_action :require_login, only: [:create, :iniciar_session, :crear_cuenta, :login]

  def login
  end

  def crear_cuenta
    @tipo_cuenta = params[:tipo_cuenta] || 'cem'

    # if tipo_cuenta == 'familia'
    #   @
    # end
  end

  def create
    # return render json: login_params.to_h

    login = Login.find_by(username: login_params[:username])
    url_cuenta_ya_existe = "/crear_cuenta?tipo_cuenta=#{login_params[:tipo_cuenta]}&alert=cuenta_ya_existe"
    return redirect_to url_cuenta_ya_existe if login.present?

    perfil = Perfil.find(login_params[:perfil_id])

    if perfil.es_cem?
      actor = Cem.first

    elsif perfil.es_cel?
      cel = Cel.find_by(nombre: login_params[:nombre_actor])
      return redirect_to url_cuenta_ya_existe if cel.present?

      actor = Cel.create!(nombre: login_params[:nombre_actor], pais_id: login_params[:pais_id])
    elsif perfil.es_alumno?
      alumno = Alumno.find_by(nombre: login_params[:nombre_actor])
      return redirect_to url_cuenta_ya_existe if alumno.present?

      actor = Alumno.create!(nombre: login_params[:nombre_actor], codigo_alumno: SecureRandom.base58(10).upcase)
    elsif perfil.es_familia?
      familia = Familia.find_by(nombre: login_params[:nombre_actor])
      return redirect_to url_cuenta_ya_existe if familia.present?

      actor = Familia.create!(nombre: login_params[:nombre_actor], pais_id: login_params[:pais_id])
    end


    login = Login.create!(username: login_params[:username], password: login_params[:password], actor_id: actor.id,  nombre_tabla_actor: actor.class.name, perfil_id: perfil.id)
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
    return redirect_to '/programa_estudio/index?alert=login_correcto'
  end

  def login_params
    params.require(:login).permit(:email, :password, :username, :perfil_id, :pais_id, :tipo_cuenta, :nombre_actor)
  end

  def logout
    session[:logged_user] = nil
    return redirect_to '/login?alert=sesion_terminada'
  end
end
