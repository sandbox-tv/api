class SessionsController < ApplicationController
  def create
    user = User.authenticate(params[:username], params[:password])

    if user
      token = sign_in user
      render json: Session.find_by_uuid(token)
    else
      render json: {errors: ['Username or password is invalid']}
    end
  end

  def destroy
    session = Session.find_by_id(params[:sessiontoken])

    if session
      render json: {message: 'Session destroyed'}
    else
      render json: {errors: ['Session not found']}
    end
  end
end
