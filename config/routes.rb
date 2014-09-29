Rails.application.routes.draw do
  get "/" => "galleries#index"
  get "/galleries/new" => "galleries#new"
  post "/galleries" => "galleries#create"
  get "/galleries/:id" => "galleries#show"
  get "/galleries/:id/edit" => "galleries#edit"
end
