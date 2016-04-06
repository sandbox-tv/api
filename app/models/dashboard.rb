class Dashboard
  include Rails.application.routes.url_helpers
  include ActiveModel::Serialization

  attr_reader :user

  def initialize(user)
    @user = user
  end

  def path
    user_dashboard_path(user)
  end
end
