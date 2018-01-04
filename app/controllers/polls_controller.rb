class PollsController < ApplicationController
  before_action :set_poll, only: [:show, :update, :destroy]

  # GET /polls
  def index
    @polls = Poll.all

    render json: @polls
  end

  # GET /polls/1
  def show
    render json: @poll
  end

  # POST /polls
  def create
    @poll = Poll.new(poll_params)
    # @poll.presentation_id = params[:presentation_id]

    if @poll.save
      render json: @poll, status: :created, location: @poll
    else
      render json: @poll.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /polls/1
  def update
    if @poll.update(poll_params)
      render json: @poll
    else
      render json: @poll.errors, status: :unprocessable_entity
    end
  end

  # DELETE /polls/1
  def destroy
    @presentation = Presentation.find(@poll.presentation_id)
    @poll.destroy
    count = @presentation.current_slide - 1 unless @presentation.current_slide == 0
    @presentation.update_attribute(:current_slide, count) unless !count
    render json: @presentation
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poll
      @poll = Poll.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def poll_params
      params.require(:poll).permit(
        :content,
        :presentation_id,
        :response_type,
        :feedback_type,
        :items,
        items_attributes: [:id, :content, :correct, :responses]
        )
    end
end
