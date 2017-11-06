class PetsController < ApplicationController
  def index
    pets = Pet.all

    render(
      json: pets.as_json(only: [:age, :id, :human, :name]),
      status: :ok
    )
  end

  def show
    pet = Pet.find_by(id: params[:id])

    if pet
      render(
        json: pet.as_json(only: [:id, :name, :age, :human]), status: :ok
      )
    else
      render(
        json: {nothing: true}, status: :not_found
      )
    end
  end
end
