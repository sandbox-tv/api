module UserRepository
  def self.create(options)
    user = User.create(options)
    ChannelRepository.create(user: user)
    user
  end
end
