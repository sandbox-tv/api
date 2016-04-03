module SessionsHelper
  def sign_in(user)
    session = Session.create(uuid: SecureRandom.uuid, user: user)
    session.uuid
  end
end
