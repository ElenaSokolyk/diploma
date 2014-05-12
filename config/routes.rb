Diploma::Application.routes.draw do
  devise_for :users

  authenticated :user do
    root to: "articles#index", as: :user_root
  end
  root to: "pages#landing"

  resources :articles, only: [:index, :create, :new,  :show]
end
