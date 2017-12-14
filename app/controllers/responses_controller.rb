class ResponsesController < ApplicationController
  skip_before_action :authenticate_request
  def add
    @response = Response.new(response_params)
    if @response.save
      @presentation = Presentation.find(params[:id])
      ActionCable.server.broadcast "response_channel#{params[:id]}", { data: @presentation }
    else
      render json: @response.errors, status: :unprocessable_entity
    end
  end

  private
    def response_params
      params.require(:response).permit(:item_id)
    end

end
