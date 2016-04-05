class ChannelSerializer < ActiveModel::Serializer
  attributes :self, :name

  has_one :video_stream

  def self
    {
      path: object.path
    }
  end
end
