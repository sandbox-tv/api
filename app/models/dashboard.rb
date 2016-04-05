class Dashboard
  include Rails.application.routes.url_helpers
  include ActiveModel::Serialization

  attr_reader :user

  def path
    user_dashboard_path(user)
  end

  def initialize(user)
    @user = user
  end
end
