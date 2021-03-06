class UsersController < ApplicationController
      before_action :set_user, only: [:show, :edit, :update, :destroy]
      before_action :require_user, only: [:edit, :update]
      before_action :require_same_user, only: [:edit, :update]

      def show 
            @articles = @user.articles.paginate(page: params[:page], per_page: 5) 
      end 

      def index 
            @users = User.paginate(page: params[:page], per_page: 5)
      end 

      def new 
            @user = User.new
      end 

      def edit 
      end 

      def update 
          if @user.update(user_params)
            flash[:notice] = "Tu perfil ha sido actualizado"
            redirect_to @user
          else
            render 'edit'
          end 
      end 

      def create 
            @user = User.new(user_params)
            if @user.save 
                  session[:user_id] = @user.id
                  flash[:notice] = "Bienvenido a  Articulos, #{@user.username}"
                  redirect_to articles_path
            else
                  render 'new'
            end  
      end 

      def destroy 
            if @user.destroy 
                  flash[:alert] = "Se ha eliminado tu cuenta"
                  session[:user_id] = nil 
                  redirect_to root_path  
            else  
                  redirect_to articles_path
            end
      end 

      private 
      def user_params
            params.require(:user).permit(:username, :email, :password)
      end 

      def set_user
            @user = User.find(params[:id])
      end 

      def require_same_user
            if current_user != @user 
                  flash[:alert] = "Solo puedes editar tu perfil"
                  redirect_to @user 
            end 
      end 
end 