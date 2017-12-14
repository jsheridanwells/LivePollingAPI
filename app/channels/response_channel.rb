class ResponseChannel < ApplicationCable::Channel
  def subscribed
    stream_from "response_channel#{params[:presentation_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
