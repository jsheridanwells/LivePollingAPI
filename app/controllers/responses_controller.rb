class ResponsesController < ApplicationController
  before_action :set_presentation
  skip_before_action :authenticate_request

  def add
    response = Response.new(response_params)
    if response.save
      count_responses(params[:poll_id])
      ActionCable.server.broadcast "response_channel#{params[:presentation_id]}", { data: @responses_arr }
    else
      render json: response.errors, status: :unprocessable_entity
    end
  end

  private
    def response_params
      params.require(:response).permit(:item_id, :written)
    end

    def set_presentation
      @presentation = Presentation.find(params[:presentation_id])
    end

    def count_responses(poll_id)
      @responses_arr = Array.new
      items = Item.where(poll_id: poll_id)
      items.each do |item|
        responses = Response.where(item_id: item.id).size
        @responses_arr.push(responses)
      end
    end
end
