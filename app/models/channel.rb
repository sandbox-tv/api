class Channel < ActiveRecord::Base
  include Rails.application.routes.url_helpers

  belongs_to :user
  before_save :set_default_name

  def path
    user_channel_path(user)
  end

  def set_default_name
    self.name ||= 'Untitled'
  end

  def video_stream
    @video_stream || VideoStream.new(username: user.username)
  end
end
