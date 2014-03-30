Diploma::Application.routes.draw do
  devise_for :users
  get "pages/index"
  root to: "pages#index"

  resources :articles, only: [:create, :new]
end
