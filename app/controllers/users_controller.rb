class UsersController < ApplicationController
    before_action :authorize_request, except: :create
    before_action :find_user, except: %i[create index]

    def index
        @users = User.all
        render json: @users 
    end

    def show
        @user = User.find(params[:id])
        render json: @user
    end

    # POST /users
    # body: { :username, :password}
    def create
        @user = User.create(user_params)
        if @user.valid?
            token = JWT.encode({user_id: @user.id}, SECRET, 'HS256')
            render json: {user: @user, token: token}
        else
            render json: {status: 500, errors: @user.errors.full_messages}
        end
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        render json: @user
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
    end

    private

    def find_user
        @user = User.find(params[:id])
        rescue ActiveRecord::RecordNotFound
          render json: { errors: 'User not found' }, status: :not_found
    end

    def user_params
        params.permit(:username, :password)
    end

end