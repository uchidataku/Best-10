# frozen_string_literal: true
# ItemsController
class ItemsController < ApplicationController
  load_and_authorize_resource :ranking
  load_and_authorize_resource through: :ranking, shallow: true

  def create
    fail Errors::UnauthorizedError, 'ログインしてください' unless current_account

    @item.account = current_account
    @item.save!
    render json: @item, status: :created
  end

  def update
    @item.update!(resource_params)
    render json: @item
  end

  def destroy
    @item.destroy!
    head 204
  end

  private

  def resource_params
    params.require(:item).permit(:name, :description, :image)
  end
end
