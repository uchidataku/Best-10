# frozen_string_literal: true
class LikesController < ApplicationController
  def create
    @like = Like.create!(account: current_account, item_id: params[:item_id])
    render json: @like, status: :created
  end
end
