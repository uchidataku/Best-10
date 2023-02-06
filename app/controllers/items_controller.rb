# frozen_string_literal: true
# ItemsController
class ItemsController < ApplicationController
  def create
    @item = Item.create!(resource_params.merge(ranking_id: params[:ranking_id]))
    render json: @item, status: :created
  end

  def update

  end

  def destroy

  end

  private

  def resource_params
    params.require(:item).permit(:name)
  end
end
