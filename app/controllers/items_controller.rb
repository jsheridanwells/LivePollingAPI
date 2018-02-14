class ItemsController < ApplicationController
  before_action :set_item, only: [:destroy]

  # DELETE /items/1
  def destroy
    @item.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def item_params
      params.require(:item).permit(:poll_id, :id, :content, :correct, :responses)
    end
end
