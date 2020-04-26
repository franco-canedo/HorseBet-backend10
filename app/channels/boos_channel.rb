class BoosChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    game = Conversation.find(params[:game])
    stream_for game
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
