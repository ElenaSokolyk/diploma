Diploma::Application.routes.draw do
  devise_for :users
  get "pages/index"
  root to: "pages#landing"

  authenticated :user do
    root :to => "pages#index", as: :user_root
  end

  resources :articles, only: [:create, :new]
end
