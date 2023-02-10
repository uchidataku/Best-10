# frozen_string_literal: true
# GenreCategoriesController
class GenreCategoriesController < ApplicationController
  load_and_authorize_resource :genre_categories

  def index
    render json: @genre_categories
  end
end
