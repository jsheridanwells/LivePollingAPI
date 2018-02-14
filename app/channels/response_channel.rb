class ResponseChannel < ApplicationCable::Channel
  def subscribed
    stream_from "response_channel#{params[:presentation_id]}"
  end
end
