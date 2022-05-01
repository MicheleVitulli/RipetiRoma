# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users,
             controllers: { registrations: 'users/registrations', omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'home#index'
  resources :users, only: [:show]
  resources :users do
    resources :reviews
  end
  resources :users do
    resources :messages
  end
  resources :teaches
  resources :courses
  resources :subjects
  get 'users/index'
  get 'messages/create'
  get 'subjects/:id/insegna' => 'users#insegna_materia', :via => :get, :as => :insegna_materia_user
  get 'subjects/:id/ninsegna' => 'users#noninsegna_materia', :via => :get, :as => :noninsegna_materia_user
  get 'courses/amateria/:id.(:materia_id)' => 'subjects#aggiungi_materia', :via => :get,
      :as => :aggiungi_materia_subject
  get 'courses/new/corso/:id' => 'users#fa_corso', :via => :get, :as => :fa_corso_user
  get 'courses/new/ncorso/:id' => 'users#nonfa_corso', :via => :get, :as => :nonfa_corso_user
  get 'users', to: 'users#index', as: :user_view
  match '/users/:id', to: 'users#show', via: 'get'
  match 'users/:id' => 'users#destroy', :via => :delete, :as => :destroy_user
end
