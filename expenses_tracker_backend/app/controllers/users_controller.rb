class UsersController < ApplicationController

  def index
    users = User.all
    render json: users
  end

  def show
    user = User.find_by(params[:id])
    render json: user
  end

  # def create
  #   user = User.find_or_create_by(name: params[:name], budget: params[:budget])
  #   render json: user
  # end
  #
  # def update
  #   user = User.update(name: params[:name], budget: params[:budget])
  #   render json: user
  # end
  #
  # def destroy
  #   user = User.find_by(id: params[:id])
  #   user.destroy
  #   render json: { "Message": "User was deleted" }
  # end
end
