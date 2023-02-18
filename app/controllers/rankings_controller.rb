# frozen_string_literal: true
# RankingsController
class RankingsController < ApplicationController
  load_resource :ranking, only: %i[index show]
  load_and_authorize_resource :ranking, only: :create

  def index
    @rankings = @rankings.with_keyword(params[:keyword]) if params[:keyword]
    @rankings = @rankings.with_genre(params[:genre_ids]) if params[:genre_ids]
    @rankings = @rankings.sort_by_params(params[:sort_by]) if params[:sort_by]
    total_data_nums = @rankings.size
    @rankings = @rankings.page(params[:page] ||= 1).per(Best10::Pagination::DEFAULT_LIMIT)
    render json: @rankings, include: %i[creator genres], meta: total_data_nums, meta_key: 'total_data_nums'
  end

  def show
    render json: @ranking, include: %i[creator items genres]
  end

  def create
    fail Errors::UnauthorizedError, 'ログインしてください' unless current_account

    @ranking.creator = current_account
    @ranking.save!
    render json: @ranking, status: :created
  end

  private

  def resource_params
    params.require(:ranking).permit(:title, genre_ids: [])
  end
end
