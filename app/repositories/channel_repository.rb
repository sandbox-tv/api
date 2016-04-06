module ChannelRepository
  def self.create(options)
    options[:name] ||= 'Untitled'
    Channel.create(options)
  end
end
