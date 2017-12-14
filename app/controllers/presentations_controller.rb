class PresentationsController < ApplicationController
  skip_before_action :authenticate_request, only: [:show_to_participant]
  before_action :set_presentation, only: [
    :show,
    :show_to_participant,
    :update,
    :broadcast,
    :next_slide,
    :prev_slide,
    :destroy
  ]

  # GET /presentations
  def index
    @presentations = Presentation.where(user_id: @current_user.id)
    render json: @presentations
  end

  # GET /presentations/1
  def show
    render json: @presentation
  end

  def show_to_participant
    if @presentation.broadcasting
      render json: @presentation
    else
      render json: { message: 'This presentation is not currently available', title: @presentation.title }
    end

  end

  # POST /presentations
  def create
    @presentation = Presentation.new(presentation_params)

    if @presentation.save
      render json: @presentation, status: :created, location: @presentation
    else
      render json: @presentation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /presentations/1
  def update
    if @presentation.update(presentation_params)
      render json: @presentation
    else
      render json: @presentation.errors, status: :unprocessable_entity
    end
  end

  # toggles true/false value of presentation broadcasting
  def broadcast
    @presentation.update_attribute(:broadcasting, !@presentation.broadcasting)
    render json: @presentation
  end

  # advances current slide
  def next_slide
    unless (@presentation.current_slide + 1)== @presentation.polls.length
      count = @presentation.current_slide += 1
      @presentation.update_attribute(:current_slide, count)
      ActionCable.server.broadcast 'presentation_channel',
        {
          current_poll: @presentation.polls[@presentation.current_slide].content,
          items: @presentation.polls[@presentation.current_slide].items,
          current_slide: @presentation.current_slide
        }
    end
    render json: @presentation
  end

  # regresses current slide
  def prev_slide
    unless @presentation.current_slide == 0
      count = @presentation.current_slide -= 1
      @presentation.update_attribute(:current_slide, count)
      ActionCable.server.broadcast 'presentation_channel',
        {
          current_poll: @presentation.polls[@presentation.current_slide].content,
          items: @presentation.polls[@presentation.current_slide].items,
          current_slide: @presentation.current_slide
        }
    end
    render json: @presentation
  end

  # DELETE /presentations/1
  def destroy
    @presentation.destroy
    render json: :deleted
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_presentation
      @presentation = Presentation.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def presentation_params
      params.require(:presentation).permit(:user_id, :title, :broadcasting)
    end
end
