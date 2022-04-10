Rails.application.routes.draw do
  get 'messages/create'
  resources :teaches
  resources :courses
  get 'users/index'
  resources :subjects
  get 'subjects/:id/insegna' => 'users#insegna_materia', :via => :get, :as => :insegna_materia_user
  get 'subjects/:id/ninsegna' => 'users#noninsegna_materia', :via => :get, :as => :noninsegna_materia_user
  get 'courses/amateria/:id.(:materia_id)' => 'subjects#aggiungi_materia', :via => :get, :as => :aggiungi_materia_subject
  get 'courses/new/corso/:id' => 'users#fa_corso', :via => :get, :as => :fa_corso_user
  get 'courses/new/ncorso/:id' => 'users#nonfa_corso', :via => :get, :as => :nonfa_corso_user
  devise_for :users,
             controllers: { registrations: 'users/registrations', omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users, only: [:show]
  

  resources :users do
    resources :reviews
  end

  resources :users do
    resources :messages
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  # admin function

  get 'users', to: 'users#index', as: :user_view
  match '/users/:id', to: 'users#show', via: 'get'

  match 'users/:id' => 'users#destroy', :via => :delete, :as => :destroy_user
end
