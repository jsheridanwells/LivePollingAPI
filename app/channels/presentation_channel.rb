class PresentationChannel < ApplicationCable::Channel
  def subscribed
    stream_from "presentation_channel#{params[:presentation_id]}"
  end
end
