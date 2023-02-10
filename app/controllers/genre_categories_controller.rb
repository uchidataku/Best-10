# frozen_string_literal: true
# GenreCategoriesController
class GenreCategoriesController < ApplicationController
  load_resource :genre_category

  def index
    render json: @genre_categories
  end
end
