# frozen_string_literal: true

Rails.application.routes.draw do
  post :sign_in, to: 'auth#sign_in'
  post :sign_up, to: 'auth#sign_up'
end
