class PetsController < ApplicationController
  def index
    pets = Pet.all
    render json: pets: pets.as_json(only: [:id, :name, :age, :human]), 
           status: :ok
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :age, :human)
  end
end
