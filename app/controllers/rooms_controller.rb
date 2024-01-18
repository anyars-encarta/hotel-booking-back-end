class RoomsController < ApplicationController
  before_action :require_admin, only: %i[create show update destroy]

  private

  def require_admin
    redirect_to root_path unless current_user.admin?
  end
end
