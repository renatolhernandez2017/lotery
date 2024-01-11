# frozen_string_literal: true

Rails.application.routes.draw do
  root 'sessions#new'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'

  resources :sessions, only: [:new, :create, :destroy]
  resources :users

  get '/home', to: 'home#index', as: :home

  ###############
  ###   API22  ###
  ###############

  namespace :api do
    # get 'get_infos/:user_id', to: 'marketplaces#index'
  end

  namespace :webhooks do
    # post 'status_changed', to: 'orders#status_changed'
  end

  namespace :public do
    # resources :trackings, only: %i[index tracking] do
    #   collection do
    #     get 'object', to: 'trackings#tracking'
    #   end
    # end
  end

  # namespace :public, path: 'sales', module: 'public', as: nil do
    # get  ':hash/show',    to: 'sales#show',    as: :sales_form_customer
  # end
end
