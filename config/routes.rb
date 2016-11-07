Rails.application.routes.draw do
  get 'pets', to: 'pets#index', as: 'pets'

  get 'pets/:id', to: 'pets#show', as: 'pet'

end
