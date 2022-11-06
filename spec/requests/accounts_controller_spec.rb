# frozen_string_literal: true
require 'rails_helper'

RSpec.describe AccountsController, type: :request do
  let(:account) { create(:account) }
  let(:headers) { { Authorization: "Bearer #{account.jwt}" } }

  describe 'GET /current_user' do
    subject(:request) { get current_user_path, headers: headers }
    let!(:ranking) { create(:ranking, creator: account) }

    it 'Accountを取得できる' do
      request
      expect(response).to have_http_status(:ok)
      parsed_body = JSON.parse(response.body)
      expect(parsed_body['id']).to eq account.id
    end

    it 'Response OK' do
      request
      assert_response_schema_confirm(200)
    end
  end
end
