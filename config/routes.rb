Diploma::Application.routes.draw do
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  authenticated :user do
    root to: "articles#index", as: :user_root
  end
  root to: "pages#landing"

  resources :articles
  resources :comments
  resources :users do
    post 'follow', on: :member
    delete 'unfollow', on: :member
  end
  resources :documents, only: [:create, :destroy]
  match '/documents' => 'documents#create', via: :patch
end
