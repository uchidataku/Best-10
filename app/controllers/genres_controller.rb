# frozen_string_literal: true
# GenresController
class GenresController < ApplicationController
  def show
    @genre = Genre.find(params[:id])
    render json: @genre
  end

  def follow
    @genre_following = GenreFollowing.create!(genre_id: params[:id], account: current_account)
    render json: @genre_following
  end

  def unfollow
    @genre_following = GenreFollowing.find_by!(genre_id: params[:id], account: current_account)
    @genre_following.destroy!
    head 204
  end
end
