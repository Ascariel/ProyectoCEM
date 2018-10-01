class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  before_action :require_login, except: [:login, :iniciar_sesion, :crear_cuenta, :logout, :create]
  before_action :set_current_user

  def require_login
    set_current_user

    if @current_user.blank?
      Rails.logger.debug("########### Usuario No Autenticado! ############")
      return redirect_to '/iniciar_sesion?alert=debe_autenticarse'
    end
  end

  def set_current_user
    return if session[:logged_user].blank?
    @current_user = Login.find_by(id: session[:logged_user]['id'])
  end
end
