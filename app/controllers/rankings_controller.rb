# frozen_string_literal: true
class RankingsController < ApplicationController
  def index
    @rankings = Ranking.all
    render json: @rankings
  end

  def show
    @ranking = Ranking.find_by!(id: params[:id])
    render json: @ranking
  end

  def create
    @ranking = Ranking.create!(resource_params.merge(creator: current_account))
    render json: @ranking, status: :created
  end

  private

  def resource_params
    params.require(:ranking).permit(:title, :genre)
  end
end
