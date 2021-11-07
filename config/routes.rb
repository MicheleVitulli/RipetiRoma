Rails.application.routes.draw do
  resources :courses
  get 'users/index'
  resources :students
  resources :subjects
  resources :teachers
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root :to => "home#index"
  get '/adm', to: 'admins#index', :as => :admin_view
  get '/adm/admin/:id', to: 'admins#admin_user', :via => :get, :as => :admin_admin_user
  get '/adm/unadmin/:id', to: 'admins#unadmin_user', :via => :get, :as => :admin_unadmin_user

  get '/users', to: 'users#index'
end
