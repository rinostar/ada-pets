class PetsController < ApplicationController
  def index
    pets = Pet.all

    render(
      json: pets.as_json(only: [:age, :id, :human, :name]),
      status: :ok
    )
  end
end
