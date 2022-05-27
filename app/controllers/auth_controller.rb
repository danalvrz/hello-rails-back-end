class AuthController < ApplicationController
    
    # POST /login 
    # body { :username, :password }
    def login
        user = User.find_by(username: login_params[:username])
        if user && user.authenticate(login_params[:password])
            token = JWT.encode({user_id: user.id}, SECRET, 'HS256')
            render json: {user: user, token: token}
        else
            render json: { error: "username or password are invalid" }
        end
    end

    private

    def login_params
        params.permit(:username, :password)
    end
end