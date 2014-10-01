Rails.application.routes.draw do
  root "galleries#index"

  resources :users, only: [:new, :create]

  resources :galleries do
    resources :images, only: [:show, :new, :create, :edit, :update]
  end
end
