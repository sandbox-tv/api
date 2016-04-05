class DashboardSerializer < ActiveModel::Serializer
  attributes :self
  has_one :channel

  def filter(keys)
    serialization_options[:hide_channel] ? keys - [:channel] : keys
  end

  def channel
    object.user.channel
  end

  def self
    {
      path: object.path
    }
  end
end
