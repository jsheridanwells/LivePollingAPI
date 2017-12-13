class PresentationsController < ApplicationController
  before_action :set_presentation, only: [:show, :update, :broadcast, :destroy]

  # GET /presentations
  def index
    @presentations = Presentation.where(user_id: @current_user.id)
    # @presentations = Presentation.all
    render json: @presentations
  end

  # GET /presentations/1
  def show
    render json: @presentation
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
