class FavoritesController < ApplicationController
  before_action :authorize_request_fav

  # GET /users/:user_id/favorites
  def index
    @user = User.find(params[:user_id])
    @favorites = Favorite.includes(:user).where(user_id: @user.id).order(created_at: :desc) 
    render json: @favorites
  end

  # POST users/:user_id/favorites or users/:user_id/favorites.json
  # body { greeting_id: "id"}
  def create
    @user = User.find(params[:user_id])
    @favorite = Favorite.create(user_id: @user.id, greeting_id: params[:greeting_id])
    if @favorite.valid?
      render json: { message: "Favorite created!"}
    else
      render json: {status: 500, message: @greeting.id, errors: @favorite.errors.full_messages}
    end
  end

  # DELETE users/:user_id/favorites/:id or users/:user_id/favorites/:id.json
  def destroy
    @user = User.find(params[:user_id])
    @favorites = Favorite.includes(:user).where(user_id: @user.id).order(created_at: :desc)
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    render json: {message: "favorite deleted!"}
  end

  #private

end