# frozen_string_literal: true
require 'rails_helper'

RSpec.describe GenresController, type: :request do
  let(:account) { create(:account) }
  let(:headers) { { Authorization: "Bearer #{account.jwt}" } }

  describe 'POST /genres/:id/follow' do
    subject(:request) { post follow_genre_path(genre.id), headers: headers }
    let(:genre) { Genre.find_by(name: '芸能') }

    it 'ジャンルをフォローできる' do
      expect { request }.to change(GenreFollowing, :count).by(+1)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'DELETE /genres/:id/unfollow' do
    subject(:request) { delete unfollow_genre_path(genre.id), headers: headers }
    let(:genre) { Genre.find_by(name: '芸能') }
    let!(:genre_following) { create(:genre_following, account: account, genre: genre) }

    it 'ジャンルをアンフォローできる' do
      expect { request }.to change(GenreFollowing, :count).by(-1)
      expect(response).to have_http_status(:no_content)
    end
  end
end
