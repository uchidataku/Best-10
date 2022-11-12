# frozen_string_literal: true
# GenreCategoriesController
class GenreCategoriesController < ApplicationController
  def index
    @genre_categories = GenreCategory.all
    render json: @genre_categories
  end
end
