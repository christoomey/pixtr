Rails.application.routes.draw do
  root "galleries#index"

  resources :galleries do
    resources :images, only: [:show, :new, :create, :edit, :update]
  end
end
