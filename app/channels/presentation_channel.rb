class PresentationChannel < ApplicationCable::Channel
  def subscribed
    stream_from "presentation_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
