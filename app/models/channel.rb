class Channel < ActiveRecord::Base
  include Rails.application.routes.url_helpers

  belongs_to :user

  def path
    user_channel_path(user)
  end

  def video_stream
    @video_stream ||= VideoStream.new(username: user.username)
  end

  def chat
    @chat ||= Chat.new
  end
end
