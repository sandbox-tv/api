class UsersController < ApplicationController
  before_action :authenticate!, only: [:show]

  def show
    render json: current_user
  end

  def create
    user = UserRepository.create(username: params[:username], password: params[:password])

    if user.save
      token = sign_in user
      render json: Session.find_by_uuid(token)
    else
      render json: {errors: user.errors.full_messages}
    end
  end
end
