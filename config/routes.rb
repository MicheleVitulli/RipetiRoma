Rails.application.routes.draw do
  resources :teaches
  resources :courses
  get 'users/index'
  resources :subjects
  get 'subjects/:id/insegna' => 'users#insegna_materia', :via => :get, :as => :insegna_materia_user
  get 'subjects/:id/ninsegna' => 'users#noninsegna_materia', :via => :get, :as => :noninsegna_materia_user
  get 'courses/new/corso/:id' => 'users#fa_corso', :via => :get, :as => :fa_corso_user
  get 'courses/new/ncorso/:id' => 'users#nonfa_corso', :via => :get, :as => :nonfa_corso_user
devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root :to => "home#index"

  #admin function


  get 'users', to: 'users#index', :as => :user_view

  match 'users/:id' => 'users#destroy', :via => :delete, :as => :destroy_user
end
