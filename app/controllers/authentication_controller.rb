module AuthenticationController
  def authenticate
    @user = Session.find_by_uuid(params[:sessiontoken]).try(:user)
  end

  def authenticate!
    unless @user
      render json: {errors: ['Need to authenticate']}
    end
  end

  def current_user
    @user
  end

  def authenticated?
    !!current_user
  end
end
