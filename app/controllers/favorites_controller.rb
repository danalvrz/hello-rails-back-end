class FavoritesController < ApplicationController
  before_action :authorize_request_fav, except: :create
  before_action :find_user, except: %i[create index]

  # GET /users/:user_id/favorites
  def index
    @user = User.find(params[:user_id])
    @favorites = Favorite.includes(:user).where(user_id: @user.id).order(created_at: :desc) 
    render json: @favorites
  end

  # # GET /favorites/1.json
  # def show
  #   @favorite = Favorite.find(params[:id])
  #   render json: @favorite
  # end

  # # GET /favorites/new
  # def new
  # end

  # # GET /favorites/1/edit
  # def edit
  # end

  # # POST /favorites or /favorites.json
  # def create
  #   @favorite = Favorite.create(
  #     user_id: params[:user_id],
  #     car_id: params[:car_id]
  #   )
  #   render json: @favorite
  # end

  # # PATCH/PUT /favorites/1 or /favorites/1.json
  # def update
  #   @favorite = Favorite.find(params[:id])
  #   @favorite.update(
  #     user_id: params[:user_id],
  #     car_id: params[:car_id]
  #   )
  #   render json: @favorite
  # end

  # def update_favorite
  # end

  # # DELETE /favorites/1 or /favorites/1.json
  # def destroy
  #   @favorites = Favorite.all
  #   @favorite = Favorite.find(params[:id])
  #   @favorite.destroy
  #   render json: @favorites
  # end

  private

  # def find_user
  #   @user = User.find(params[:user_id])
  #   rescue ActiveRecord::RecordNotFound
  #     render json: { errors: 'User not found' }, status: :not_found
  # end

  # Only allow a list of trusted parameters through.
  def favorite_params
  end
end