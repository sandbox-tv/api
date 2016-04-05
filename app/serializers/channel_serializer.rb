class ChannelSerializer < ActiveModel::Serializer
  attributes :meta, :name

  has_one :video_stream

  def meta
    {
      path: object.path
    }
  end
end
