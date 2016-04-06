class ChannelSerializer < ActiveModel::Serializer
  attributes :meta, :name

  has_one :video_stream
  has_one :chat

  def meta
    {
      path: object.path
    }
  end
end
