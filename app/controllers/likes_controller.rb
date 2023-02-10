# frozen_string_literal: true
# LikesController
class LikesController < ApplicationController
  def create
    @like = Like.new(account: current_account, item_id: params[:item_id])
    authorize! :create, @like
    @like.save!
    render json: @like, status: :created
  end

  def destroy
    @like = Like.find_by!(account: current_account, item_id: params[:item_id])
    authorize! :destroy, @like
    @like.destroy!
    head 204
  end

  # private
  #
  # def resource_params
  #   params.require(:item).permit(:item_id)
  # end
end
