# frozen_string_literal: true
require 'rails_helper'

RSpec.describe GenreCategoriesController, type: :request do
  describe 'GET /genre_categories' do
    subject(:request) { get genre_categories_path }

    it 'Ranking一覧を取得できる' do
      request
      expect(response).to have_http_status(:ok)
      parsed_body = JSON.parse(response.body)
      expect(parsed_body['genre_categories'].count).to eq 17
    end
  end
end
