# frozen_string_literal: true

Rails.application.routes.draw do
  resources :items do
    match '/import', to: 'items#import', via: :post, on: :collection
  end
  root 'items#index'
end
