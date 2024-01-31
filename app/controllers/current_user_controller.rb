class CurrentUserController < ApplicationController
  # before_action :authenticate_user!
  def index
    # render json: UserSerializer.new(current_user).serializable_hash[:data][:attributes], status: :ok
    render json: current_user
  end
end
