# frozen_string_literal: true
# GenresController
class GenresController < ApplicationController
  def show
    @genre = Genre.find(params[:id])
    render json: @genre
  end
end
