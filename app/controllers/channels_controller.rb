class ChannelsController < ApplicationController
  def index
    channels = Channel.all
    render json: channels
  end

  def show
    channel = Channel.find_by_user_id(params[:user_id])
    render json: channel
  end
end
