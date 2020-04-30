class SessionsController < ApplicationController
      def new 
      
      end 

      def create 
            user = User.find_by(email: params[:session][:email].downcase)
            if user && user.authenticate(params[:session][:password])
                  session[:user_id] = user.id 
                  flash[:notice] = "Inicio sesión con exito"
                  redirect_to user
            else 
                  flash.now[:alert] = "Algo salió mal :("
                  render 'new'
            end 
      end 

      def destroy
            session[:user_id] = nil 
            flash[:notice] = "Ah cerrado sesión"
            redirect_to root_path
      end 
end 