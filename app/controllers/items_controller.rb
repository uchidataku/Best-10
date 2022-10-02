# frozen_string_literal: true
class ItemsController < ApplicationController
  def create
    @item = Item.create!(resource_params.merge(ranking_id: params[:ranking_id]))
    render json: @item, status: :created
  end

  private

  def resource_params
    params.require(:item).permit(:name)
  end
end
