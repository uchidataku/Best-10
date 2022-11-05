# frozen_string_literal: true
require 'rails_helper'

RSpec.describe RankingsController, type: :request do
  let(:account) { create(:account) }
  let(:headers) { { Authorization: "Bearer #{account.jwt}" } }

  describe 'GET /rankings' do
    subject(:request) { get rankings_path, headers: headers, params: params }

    context 'paramsなし' do
      let(:params) { nil }

      it 'Ranking一覧を取得できる' do
        request
        expect(response).to have_http_status(:ok)
        parsed_body = JSON.parse(response.body)
        expect(parsed_body['rankings'].count).to eq 3 # seed分
      end

      it 'Response OK' do
        request
        assert_response_schema_confirm(200)
      end
    end

    context 'paramsあり' do
      context 'keyword' do
        let(:params) { { keyword: '漫画' } }

        it '指定したRanking一覧を取得できる' do
          request
          expect(response).to have_http_status(:ok)
          parsed_body = JSON.parse(response.body)
          expect(parsed_body['rankings'].count).to eq 1
        end
      end

      context 'genre' do
        let(:params) { { genre: Ranking::Genre::IT } }

        it '指定したRanking一覧を取得できる' do
          request
          expect(response).to have_http_status(:ok)
          parsed_body = JSON.parse(response.body)
          expect(parsed_body['rankings'].count).to eq 1
        end
      end

      context 'sort_by_params' do
        context 'popularity' do
          let(:params) { { sort_by: Ranking::SortBy::POPULARITY } }
          let(:first_ranking) { Ranking.order(items_count: :desc).first }

          it '指定したRanking一覧を取得できる' do
            request
            expect(response).to have_http_status(:ok)
            parsed_body = JSON.parse(response.body)
            expect(parsed_body['rankings'][0]['id']).to eq first_ranking.id
          end
        end

        context 'newest_to_oldest' do
          let(:params) { { sort_by: Ranking::SortBy::NEWEST_TO_OLDEST } }
          let(:first_ranking) { Ranking.order(created_at: :desc).first }

          it '指定したRanking一覧を取得できる' do
            request
            expect(response).to have_http_status(:ok)
            parsed_body = JSON.parse(response.body)
            expect(parsed_body['rankings'][0]['id']).to eq first_ranking.id
          end
        end
      end
    end
  end

  describe 'POST /rankings' do
    subject(:request) { post rankings_path, params: params, headers: headers }
    let(:params) { { ranking: { title: '好きな映画', genre: Ranking::Genre::ENTERTAINMENT } } }

    it 'Rankingを作成できる' do
      expect { request }.to change(Ranking, :count).by(+1)
      expect(response).to have_http_status(:created)
    end

    it 'Response OK' do
      request
      assert_response_schema_confirm(201)
    end
  end

  describe 'GET /rankings/:id' do
    subject(:request) { get ranking_path(ranking.id), headers: headers }
    let(:ranking) { create(:ranking) }
    let!(:items) { create_list(:item, 3, ranking: ranking) }

    it 'Rankingを取得できる' do
      request
      expect(response).to have_http_status(:ok)
      parsed_body = JSON.parse(response.body)
      expect(parsed_body['id']).to eq ranking.id
    end

    it 'Response OK' do
      request
      assert_response_schema_confirm(200)
    end
  end
end
