# frozen_string_literal: true
# LikesController
class LikesController < ApplicationController
  before_action :required_current_account

  def create
    @like = Like.create!(account: current_account, item_id: params[:item_id])
    render json: @like, status: :created
  end

  def destroy
    @like = Like.find_by!(account: current_account, item_id: params[:item_id])
    @like.destroy!
    head 204
  end

  private

  def required_current_account
    return if current_account.present?

    fail Errors::UnauthorizedError, 'ログインしてください'
  end
end
