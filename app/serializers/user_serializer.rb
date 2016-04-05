class UserSerializer < ActiveModel::Serializer
  attributes :username
  has_one :dashboard, hide_channel: true
  has_one :channel
end
