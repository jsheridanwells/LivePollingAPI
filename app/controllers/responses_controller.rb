class ResponsesController < ApplicationController
  before_action :set_presentation
  skip_before_action :authenticate_request

  def add
    response = Response.new(response_params)
    if response.save
      bundle_responses(@presentation.polls)
      # count_responses(@presentation.polls)
      ActionCable.server.broadcast "response_channel#{params[:id]}", { data: @response_arr }
    else
      render json: response.errors, status: :unprocessable_entity
    end
  end

  private
    def response_params
      params.require(:response).permit(:item_id)
    end

    def set_presentation
      @presentation = Presentation.find(params[:id])
    end


    # this might get replaced by count_responses
    def bundle_responses(poll_arr)
      @response_arr = Array.new
      poll_arr.each do |poll|
        items = Item.where(poll_id: poll.id)
        items.each do |item|
          responses = Response.where(item_id: item.id).count
          @response_arr.push(responses) if responses > 0
        end
      end
    end

    # def count_responses(poll_arr)
    #   @response_arr = Array.new
    #   poll_arr.each do |poll|
    #     items = Item.where(poll_id: poll.id)
    #     items.each do |item|
    #       response_count = Response.where(item_id: 1).count
    #       puts "$$$$$$$$$$$$$$response_count: #{response_count}"
    #       @response_arr.push(response)
    #     end
    #   end

    # end

end
