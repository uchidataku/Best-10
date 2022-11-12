# frozen_string_literal: true
# RankingsController
class RankingsController < ApplicationController
  def index
    @rankings = Ranking.all
    @rankings = @rankings.with_keyword(params[:keyword]) if params[:keyword]
    @rankings = @rankings.with_genre(params[:genre]) if params[:genre]
    @rankings = @rankings.sort_by_params(params[:sort_by]) if params[:sort_by]
    total_data_nums = @rankings.size
    @rankings = @rankings.page(params[:page] ||= 1).per(Best10::Pagination::DEFAULT_LIMIT)
    render json: @rankings, include: [:creator], meta: total_data_nums, meta_key: 'total_data_nums'
  end

  def show
    @ranking = Ranking.find(params[:id])
    render json: @ranking, include: %i[creator items]
  end

  def create
    @ranking = Ranking.create!(resource_params.merge(creator: current_account))
    render json: @ranking, status: :created
  end

  private

  def resource_params
    params.require(:ranking).permit(:title, :genre_ids)
  end
end
