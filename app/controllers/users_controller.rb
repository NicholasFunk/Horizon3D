class UsersController < ApplicationController
    def show
        # find the user in the database and display their information.
        @user = User.find(params[:id])
    end

    def new
        # creates a new user in the database
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            session[:user_id = @user.id]
            redirect_to @user
        else
            flash[:error] = "Not a valid username or password"
        end
    end

    def user_params
        params.require(:user).permit(:username, :password)
    end
end
