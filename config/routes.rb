# frozen_string_literal: true

Rails.application.routes.draw do
  get '/health', to: proc {
    [200, {}, ['']]
  }

  post :sign_in, to: 'auth#sign_in'
  post :sign_up, to: 'auth#sign_up'
  get :current_user, to: 'auth#current_user'

  resources :rankings, shallow: true do
    resources :items, except: %i[index show], shallow: true do
      resources :likes, only: :create
      delete '/likes', to: 'likes#destroy'
    end
  end

  resources :accounts, only: :show

  resources :genre_categories, only: :index

  resources :genres, only: :show do
    member do
      post :follow
      delete :unfollow
    end
  end
end
