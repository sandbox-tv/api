class Chat
  include ActiveModel::Serialization

  def url
    "#{ENV['CHAT_SERVER']}"
  end
end
