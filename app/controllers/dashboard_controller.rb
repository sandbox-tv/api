class DashboardController < ApplicationController
  def show
    user = User.find_by_id(params[:user_id])
    render json: user.dashboard
  end
end
