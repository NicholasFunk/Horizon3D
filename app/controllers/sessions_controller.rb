class SessionsController < ApplicationController
    def new 

    end

    def create
        @user = User.find_by(username: params[:username])

        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to root_path
        else
            flash[:notice] = "Something went wrong! Make sure your username and password are correct."
            redirect_to login_path, flash: { notice: "Invalid username or password" }
        end
    end

    def destroy 
        session[:user_id] = nil
        redirect_to root_path
    end
end
