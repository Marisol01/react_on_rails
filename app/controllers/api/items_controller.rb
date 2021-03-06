class Api::ItemsController < ApplicationController
  # before_action :set_item, only: [:show, :destroy, :update, :edit]

  def index
    render json: Item.all
  end


  def create
    @item = Item.new(item_params)
    if @item.save
      render json: @item
    else
      render json: { errors: @item.errors }, status: :unprocessable_entity
    end
  end


  def update
    # if @item.update(item_params)
    #   render json: @item
    # else
    #   render json: { errors: @item.errors }, status: :unprocessable_entity
    # end
    item = Item.find(params[:id])
    item.update(complete: !item.complete)
    render json: item
  end

  def destroy
    Item.find(params[:id]).destroy
    render json: { message: 'item is deleted' }
  end

  private

    def item_params
     params.required(:item).permit(:name, :complete)
    end

    # def set_item
      # @item = Item.find(params[:id])
    # end

end
