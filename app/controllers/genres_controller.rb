# frozen_string_literal: true
# GenresController
class GenresController < ApplicationController
  load_and_authorize_resource :genre, only: :show

  def show
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
