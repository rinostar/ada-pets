Rails.application.routes.draw do
  get 'pets', to: 'pets#index', as: 'pets'

  get 'pets/:id', to: 'pets#show', as: 'pet'

  get 'pets/search', to: 'pets#search', as: 'pet_search'

end
