# frozen_string_literal: true
# GenresController
class GenresController < ApplicationController
  def show
    render json: @genre
  end

  def follow
    @genre_following = GenreFollowing.create!(genre_id: params[:id], account: current_account)
    authorize! :create, @genre_following
    render json: @genre_following
  end

  def unfollow
    @genre_following = GenreFollowing.find_by!(genre_id: params[:id], account: current_account)
    authorize! :destroy, @genre_following
    @genre_following.destroy!
    head 204
  end
end
