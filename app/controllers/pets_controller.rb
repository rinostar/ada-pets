class PetsController < ApplicationController
  protect_from_forgery with: :null_session

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

  def create
    pet = Pet.new(pet_params)

    pet.save
    render(
      json: {id: pet.id}, status: :ok
    )
  end



 private

 def pet_params
   params.require(:pet).permit(:name, :age, :human)
 end



end
