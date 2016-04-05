class VideoStream
  include ActiveModel::Serialization

  attr_accessor :username
  attr_reader :video_url

  def initialize(username:)
    @username = username
  end

  def video_url
    "#{ENV['STREAMING_SERVER']}/#{username}"
  end
end
