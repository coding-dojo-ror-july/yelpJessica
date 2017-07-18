class UsersController < ApplicationController
    def create
        user = User.new(user_params)
        if user.valid?
            user.save
            session[:user_id] = user.id
            redirect_to '/restaurants/show'
        else  
            flash[:errors] = user.errors.full_messages    
            redirect_to '/'
        end
    end   
    def authenticate
        user = User.find_by(username: login_params[:username])
        if user.nil?
            flash[:errors] = ['User not found']
            redirect_to '/'
        elsif user.authenticate(login_params[:password])
            session[:user_id] = user.id
            redirect_to "/restaurants/show"
        else
            flash[:errors] = ['Incorrect Password']
            redirect_to '/'
        end
    end
    def logout
        reset_session
        redirect_to '/'
    end     
         
    private
        def user_params
            params.require(:user).permit(:username, :password, :password_confirmation)   
        end     
        def login_params 
            params.require(:user).permit(:username, :password)   
        end    
end
