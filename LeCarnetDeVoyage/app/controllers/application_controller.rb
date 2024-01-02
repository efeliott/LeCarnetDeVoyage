class ApplicationController < ActionController::Base

  helper_method :current_user

  def logged_in_user
    unless current_user
      # Redirigez vers la page de connexion, affichez un message d'erreur, etc.
      # Par exemple :
      redirect_to login_url, alert: "Please log in."
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in_user
    unless current_user
      redirect_to login_path, alert: "Please log in."
    end
  end
end
