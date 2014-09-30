Rails.application.routes.draw do

  root "galleries#index"

  resources :galleries
end
