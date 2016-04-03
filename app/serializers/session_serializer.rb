class SessionSerializer < ActiveModel::Serializer
  attributes :uuid
  has_one :user, serializer: UserSerializer
end
