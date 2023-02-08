class UsersController < ApplicationController

  before_action :set_user, on: [:destroy]

  def index
    @users = User.all

    render json: { users: @users }, status: 200
  end

  def create
    @user = User.unscoped.find_or_create_by(email: set_params[:email])
    if @user.update(set_params.merge(deleted: false))
      render json: @user, status: 201
    else
      render json: { errors: @user.errors }, status: 422
    end
  end

  def update
  end

  def show
  end

  def destroy
    if @user
      @user.update!(deleted: true)    
      render json: {message: 'deleted successfully'}, status: 200
    else
      render json: {message: 'user not found'}, status: 400
    end
  end

  private

  def set_params
    params.permit(:id, :first_name, :last_name, :email, :password)
  end

  def set_user
    @user = User.find_by(id: params[:id])
  end
end
