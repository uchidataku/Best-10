# frozen_string_literal: true
require 'rails_helper'

RSpec.describe AuthController, type: :request do
  let(:account) { create(:account) }
  let(:headers) { { Authorization: "Bearer #{account.jwt}" } }

  describe 'POST /sign_in' do
    subject(:request) { post sign_in_path, params: params, headers: headers }
    let!(:account) { create(:account, username: 'hoge') }

    context 'valid' do
      let(:params) { { account: { username: 'hoge', password: 'password' } } }

      it 'SignInできる' do
        request
        expect(response).to have_http_status(:ok)
        parsed_body = JSON.parse(response.body)
        expect(parsed_body['account']['id']).to eq account.id
      end

      it 'Response OK' do
        request
        assert_response_schema_confirm(200)
      end
    end

    context 'invalid' do
      let(:params) { { account: { username: 'fuga', password: 'password' } } }

      it 'Unauthorize' do
        request
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'POST /sign_up' do
    subject(:request) { post sign_up_path, params: params, headers: headers }
    let(:params) { { account: { username: 'hogehoge', password: 'password' } } }

    context 'valid' do
      it 'SignUpできる' do
        request
        expect(response).to have_http_status(:created)
        parsed_body = JSON.parse(response.body)
        expect(parsed_body['account']['username']).to eq 'hogehoge'
      end

      it 'Response OK' do
        request
        assert_response_schema_confirm(201)
      end
    end

    context '既に使用済みのusername' do
      let!(:account) { create(:account, username: 'hogehoge') }

      it 'エラー' do
        request
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
