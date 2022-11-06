# frozen_string_literal: true
# LikesController
class LikesController < ApplicationController
  def create
    @like = Like.create!(account: current_account, item_id: params[:item_id])
    render json: @like, status: :created
  end

  def destroy
    @like = Like.find_by!(account: current_account, item_id: params[:item_id])
    @like.destroy!
    head 204
  end
end
