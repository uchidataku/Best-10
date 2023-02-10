# frozen_string_literal: true
require 'rails_helper'

RSpec.describe LikesController, type: :request do
  let(:account) { create(:account) }
  let(:headers) { { Authorization: "Bearer #{account.jwt}" } }

  describe 'POST /items/:item_id/likes' do
    subject(:request) { post item_likes_path(item.id), headers: headers }
    let!(:item) { create(:item) }

    it 'Likeを作成できる' do
      expect { request }.to change(Like, :count).by(+1)
      expect(response).to have_http_status(:created)
    end
  end

  describe 'DELETE /items/:item_id/likes' do
    subject(:request) { delete item_likes_path(item.id), headers: headers }
    let!(:item) { create(:item) }
    let!(:like) { create(:like, item: item, account: target_account) }

    context '自分のLike' do
      let(:target_account) { account }

      it 'Likeを削除できる' do
        expect { request }.to change(Like, :count).by(-1)
        expect(response).to have_http_status(:no_content)
      end
    end

    context '他人のLike' do
      let(:target_account) { create(:account) }

      it 'そもそも見つからない' do
        request
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
