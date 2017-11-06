Rails.application.routes.draw do
  resources :pets, only: [:index, :show]
end
