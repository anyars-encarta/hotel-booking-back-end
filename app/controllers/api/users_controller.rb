class Api::UsersController < ApplicationController
  def index
    if params[:id]
      user = User.find(params[:id])
      render json: user
    else
      users = User.all
      render json: users
    end
  end
end
