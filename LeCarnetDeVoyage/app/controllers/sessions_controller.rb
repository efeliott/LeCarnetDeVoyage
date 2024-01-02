class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: :create
    
    def new
      # Afficher le formulaire de connexion
    end

    def create
        if params[:session].present?
          user = User.find_by(email: params[:session][:email].downcase)
          if user && user.authenticate(params[:session][:password])
            # Logique pour établir une session
            session[:user_id] = user.id
            redirect_to trips_path
          else
            # Logique pour gérer l'échec de connexion
            @login_error = "Adresse email ou mot de passe incorrect"
            render 'new'
          end
        else
            # Gérer le cas où params[:session] est nil
            @login_error = "Please fill in the login form"
            render 'new'
        end
    end
      
      
  
    def destroy
        session.delete(:user_id)
        redirect_to trips_path
    end
end