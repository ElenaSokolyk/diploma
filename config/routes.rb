Diploma::Application.routes.draw do
  devise_for :users
  root to: "pages#landing"

  authenticated :user do
    root :to => "articles#index", as: :user_root
  end
  resources :articles, only: [:index, :create, :new,  :show]
end
